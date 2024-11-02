require 'swagger_helper'


RSpec.describe "api/v1/sub_categorie_produits", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      SubCategorieProduit.create! valid_attributes
      get sub_categorie_produits_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      sub_categorie_produit = SubCategorieProduit.create! valid_attributes
      get sub_categorie_produit_url(sub_categorie_produit), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new SubCategorieProduit" do
        expect {
          post sub_categorie_produits_url,
               params: { sub_categorie_produit: valid_attributes }, headers: valid_headers, as: :json
        }.to change(SubCategorieProduit, :count).by(1)
      end

      it "renders a JSON response with the new sub_categorie_produit" do
        post sub_categorie_produits_url,
             params: { sub_categorie_produit: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new SubCategorieProduit" do
        expect {
          post sub_categorie_produits_url,
               params: { sub_categorie_produit: invalid_attributes }, as: :json
        }.to change(SubCategorieProduit, :count).by(0)
      end

      it "renders a JSON response with errors for the new sub_categorie_produit" do
        post sub_categorie_produits_url,
             params: { sub_categorie_produit: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested sub_categorie_produit" do
        sub_categorie_produit = SubCategorieProduit.create! valid_attributes
        patch sub_categorie_produit_url(sub_categorie_produit),
              params: { sub_categorie_produit: new_attributes }, headers: valid_headers, as: :json
        sub_categorie_produit.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the sub_categorie_produit" do
        sub_categorie_produit = SubCategorieProduit.create! valid_attributes
        patch sub_categorie_produit_url(sub_categorie_produit),
              params: { sub_categorie_produit: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the sub_categorie_produit" do
        sub_categorie_produit = SubCategorieProduit.create! valid_attributes
        patch sub_categorie_produit_url(sub_categorie_produit),
              params: { sub_categorie_produit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested sub_categorie_produit" do
      sub_categorie_produit = SubCategorieProduit.create! valid_attributes
      expect {
        delete sub_categorie_produit_url(sub_categorie_produit), headers: valid_headers, as: :json
      }.to change(SubCategorieProduit, :count).by(-1)
    end
  end
end
