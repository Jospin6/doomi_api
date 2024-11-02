require 'swagger_helper'


RSpec.describe "api/v1/transactions", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      Transaction.create! valid_attributes
      get transactions_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transaction = Transaction.create! valid_attributes
      get transaction_url(transaction), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Transaction" do
        expect {
          post transactions_url,
               params: { transaction: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Transaction, :count).by(1)
      end

      it "renders a JSON response with the new transaction" do
        post transactions_url,
             params: { transaction: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Transaction" do
        expect {
          post transactions_url,
               params: { transaction: invalid_attributes }, as: :json
        }.to change(Transaction, :count).by(0)
      end

      it "renders a JSON response with errors for the new transaction" do
        post transactions_url,
             params: { transaction: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested transaction" do
        transaction = Transaction.create! valid_attributes
        patch transaction_url(transaction),
              params: { transaction: new_attributes }, headers: valid_headers, as: :json
        transaction.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the transaction" do
        transaction = Transaction.create! valid_attributes
        patch transaction_url(transaction),
              params: { transaction: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the transaction" do
        transaction = Transaction.create! valid_attributes
        patch transaction_url(transaction),
              params: { transaction: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested transaction" do
      transaction = Transaction.create! valid_attributes
      expect {
        delete transaction_url(transaction), headers: valid_headers, as: :json
      }.to change(Transaction, :count).by(-1)
    end
  end
end
