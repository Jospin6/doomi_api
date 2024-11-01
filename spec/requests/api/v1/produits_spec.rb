require 'rails_helper'


RSpec.describe "api/v1/produits", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Produit.create! valid_attributes
      get produits_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      produit = Produit.create! valid_attributes
      get produit_url(produit), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Produit" do
        expect {
          post produits_url,
               params: { produit: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Produit, :count).by(1)
      end

      it "renders a JSON response with the new produit" do
        post produits_url,
             params: { produit: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Produit" do
        expect {
          post produits_url,
               params: { produit: invalid_attributes }, as: :json
        }.to change(Produit, :count).by(0)
      end

      it "renders a JSON response with errors for the new produit" do
        post produits_url,
             params: { produit: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested produit" do
        produit = Produit.create! valid_attributes
        patch produit_url(produit),
              params: { produit: new_attributes }, headers: valid_headers, as: :json
        produit.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the produit" do
        produit = Produit.create! valid_attributes
        patch produit_url(produit),
              params: { produit: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the produit" do
        produit = Produit.create! valid_attributes
        patch produit_url(produit),
              params: { produit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested produit" do
      produit = Produit.create! valid_attributes
      expect {
        delete produit_url(produit), headers: valid_headers, as: :json
      }.to change(Produit, :count).by(-1)
    end
  end
end
