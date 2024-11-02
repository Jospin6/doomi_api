require 'swagger_helper'


RSpec.describe "api/v1/paiements", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      Paiement.create! valid_attributes
      get paiements_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      paiement = Paiement.create! valid_attributes
      get paiement_url(paiement), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Paiement" do
        expect {
          post paiements_url,
               params: { paiement: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Paiement, :count).by(1)
      end

      it "renders a JSON response with the new paiement" do
        post paiements_url,
             params: { paiement: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Paiement" do
        expect {
          post paiements_url,
               params: { paiement: invalid_attributes }, as: :json
        }.to change(Paiement, :count).by(0)
      end

      it "renders a JSON response with errors for the new paiement" do
        post paiements_url,
             params: { paiement: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested paiement" do
        paiement = Paiement.create! valid_attributes
        patch paiement_url(paiement),
              params: { paiement: new_attributes }, headers: valid_headers, as: :json
        paiement.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the paiement" do
        paiement = Paiement.create! valid_attributes
        patch paiement_url(paiement),
              params: { paiement: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the paiement" do
        paiement = Paiement.create! valid_attributes
        patch paiement_url(paiement),
              params: { paiement: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested paiement" do
      paiement = Paiement.create! valid_attributes
      expect {
        delete paiement_url(paiement), headers: valid_headers, as: :json
      }.to change(Paiement, :count).by(-1)
    end
  end
end
