require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  let(:user_params) do
    {
      user: {
        name: 'test_user',
        email: 'test_user@gmail.com',
        password: 'password'
      }
    }
  end

  path '/api/v1/users' do
    post('create user') do
      consumes 'application/json'
      parameter name: :user_params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: { name: { type: :string }, email: { type: :string }, password: { type: :string } },
            required: %w[name email password]
          }
        },
        required: ['user']
      }

      response '201', 'user created' do
        before do
          post '/api/v1/users', params: user_params.to_json, headers: { 'Content-Type': 'application/json' }
        end

        it 'returns a 201 response' do
          expect(response).to have_http_status(201)
        end

        it 'returns the token in the response' do
          json_response = JSON.parse(response.body)
          expect(json_response).to include('token')
        end
      end
      response '422', 'unprocessable entity' do
        let(:user_params) { { name: nil, email: nil, password: nil } }
        run_test!
      end
    end
  end
end
