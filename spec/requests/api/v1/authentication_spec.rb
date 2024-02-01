require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do
  path '/api/v1/login' do
    post('login authentication') do
      consumes 'application/json'
      parameter name: :login_params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
    end
  end
end
