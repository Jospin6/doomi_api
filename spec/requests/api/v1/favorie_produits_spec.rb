require 'swagger_helper'

RSpec.describe "api/v1/favorie_produits", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      FavorieProduit.create! valid_attributes
      get favorie_produits_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      favorie_produit = FavorieProduit.create! valid_attributes
      get favorie_produit_url(favorie_produit), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new FavorieProduit" do
        expect {
          post favorie_produits_url,
               params: { favorie_produit: valid_attributes }, headers: valid_headers, as: :json
        }.to change(FavorieProduit, :count).by(1)
      end

      it "renders a JSON response with the new favorie_produit" do
        post favorie_produits_url,
             params: { favorie_produit: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new FavorieProduit" do
        expect {
          post favorie_produits_url,
               params: { favorie_produit: invalid_attributes }, as: :json
        }.to change(FavorieProduit, :count).by(0)
      end

      it "renders a JSON response with errors for the new favorie_produit" do
        post favorie_produits_url,
             params: { favorie_produit: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested favorie_produit" do
        favorie_produit = FavorieProduit.create! valid_attributes
        patch favorie_produit_url(favorie_produit),
              params: { favorie_produit: new_attributes }, headers: valid_headers, as: :json
        favorie_produit.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the favorie_produit" do
        favorie_produit = FavorieProduit.create! valid_attributes
        patch favorie_produit_url(favorie_produit),
              params: { favorie_produit: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the favorie_produit" do
        favorie_produit = FavorieProduit.create! valid_attributes
        patch favorie_produit_url(favorie_produit),
              params: { favorie_produit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested favorie_produit" do
      favorie_produit = FavorieProduit.create! valid_attributes
      expect {
        delete favorie_produit_url(favorie_produit), headers: valid_headers, as: :json
      }.to change(FavorieProduit, :count).by(-1)
    end
  end
end
