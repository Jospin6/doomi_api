require 'swagger_helper'

RSpec.describe "api/v1/calls", type: :request do

  path "api/v1/calls" do
    get("List calls") do
      tags 'Calls'
      produces 'application/json'

      response '200', 'successful' do
        run_test! do |response|
          expect(response).to have_http_status(200) 
        end
      end
    end

    post("New call") do 
      tags 'Calls'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :call, in: :body, require: true, schema: {
        type: :object,
        properties: {
          caller: {type: :integer},
          receiver: {type: :integer},
          call_type: {type: :string},
          status: {type: :string}
        }, required: ['caller', 'receiver', 'call_type', 'status']
      }
      response '201', 'Call created' do 
        let(:call) {attributes_for(:call)}
        
        run_test! do |response|
          expect(response).to have_http_status(201)
          expect(response.body['call_type']).to eq(call[:call_type])  
        end
      end
    end
  end

  path "api/v1/calls/{id}" do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get("Shaw call") do
      response(200, 'successful') do
        let(:id) { 10 }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update call') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update call') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete call') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

  end
end
