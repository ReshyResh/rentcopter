require 'swagger_helper'

RSpec.describe 'api/v1/helicopters', type: :request do
  # path '/api/v1/helicopters' do
  #   get('list helicopters') do
  #     response(200, 'successful') do
  #       after do |example|
  #         # example.metadata[:response][:content] = {
  #         #   'application/json' => {
  #         #     example: JSON.parse(response.body, symbolize_names: true)
  #         #   }
  #         # }
  #       end
  #       run_test!
  #     end
  #   end

  #   post('create helicopter') do
  #     response(200, 'successful') do
  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  path '/api/v1/helicopters/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    user = User.create(name: 'Tester', email: 'druguser921@gmail.com', password: '123456', admin: true, id: 87)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    # This will add a valid token for `user` in the `Authorization` header
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)

    get('show helicopter') do
      response(200, 'successful') do
        let(:id) { '123' }
        let(:Authorization) { "Bearer #{token}" }

        after do |example|
          # example.metadata[:response][:content] = {
          #   'application/json' => {
          #     example: JSON.parse(response.body, symbolize_names: true)
          #   }
          # }
        end
        run_test!
      end
    end

  #   delete('delete helicopter') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  end
end
