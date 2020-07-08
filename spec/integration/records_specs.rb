require 'swagger_helper'

describe 'Records API' do
  path '/api/v1/records' do
    post 'Creates a record' do
      tags 'Records'
      consumes 'application/json', 'application/xml'
      parameter name: :record, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          year: { type: :string }
        },
        required: [ 'title', 'year' ]
      }
      response '201', 'record created' do
        let(:record) { { title: 'Invinsible', year: '1998' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:record) { { title: 'Invinsible' } }
        run_test!
      end
    end
  end