require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/categorie_produits", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # CategorieProduit. As you add validations to CategorieProduit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CategorieProduitsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      CategorieProduit.create! valid_attributes
      get categorie_produits_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      categorie_produit = CategorieProduit.create! valid_attributes
      get categorie_produit_url(categorie_produit), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CategorieProduit" do
        expect {
          post categorie_produits_url,
               params: { categorie_produit: valid_attributes }, headers: valid_headers, as: :json
        }.to change(CategorieProduit, :count).by(1)
      end

      it "renders a JSON response with the new categorie_produit" do
        post categorie_produits_url,
             params: { categorie_produit: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CategorieProduit" do
        expect {
          post categorie_produits_url,
               params: { categorie_produit: invalid_attributes }, as: :json
        }.to change(CategorieProduit, :count).by(0)
      end

      it "renders a JSON response with errors for the new categorie_produit" do
        post categorie_produits_url,
             params: { categorie_produit: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested categorie_produit" do
        categorie_produit = CategorieProduit.create! valid_attributes
        patch categorie_produit_url(categorie_produit),
              params: { categorie_produit: new_attributes }, headers: valid_headers, as: :json
        categorie_produit.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the categorie_produit" do
        categorie_produit = CategorieProduit.create! valid_attributes
        patch categorie_produit_url(categorie_produit),
              params: { categorie_produit: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the categorie_produit" do
        categorie_produit = CategorieProduit.create! valid_attributes
        patch categorie_produit_url(categorie_produit),
              params: { categorie_produit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested categorie_produit" do
      categorie_produit = CategorieProduit.create! valid_attributes
      expect {
        delete categorie_produit_url(categorie_produit), headers: valid_headers, as: :json
      }.to change(CategorieProduit, :count).by(-1)
    end
  end
end
