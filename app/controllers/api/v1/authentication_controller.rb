class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:login]
  skip_before_action :verify_authenticity_token, only: [:login]

  def login
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      if validate_token(user.token)
        render json: { success: true, user: { id: user.id, name: user.name, email: user.email, admin: user.admin }, message: 'Login Successfully', token: user.token },
               status: :ok
      else
        render json: { error: true, message: 'Oops! you are not unauthorized!' }, status: :ok
      end
    else
      render json: { error: true, message: 'Oops! could not login! Check your Email or Password!' },
             status: :unauthorized
    end
  end

  private

  def validate_token(token)
    @decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
    @current_user = User.find(@decoded['id'])
    session[:current_user] = @current_user
    true
  rescue JWT::DecodeError
    false
  end
end
