require 'rails_helper'


RSpec.describe "api/v1/vitrines", type: :request do

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
      Vitrine.create! valid_attributes
      get vitrines_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      vitrine = Vitrine.create! valid_attributes
      get vitrine_url(vitrine), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Vitrine" do
        expect {
          post vitrines_url,
               params: { vitrine: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Vitrine, :count).by(1)
      end

      it "renders a JSON response with the new vitrine" do
        post vitrines_url,
             params: { vitrine: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vitrine" do
        expect {
          post vitrines_url,
               params: { vitrine: invalid_attributes }, as: :json
        }.to change(Vitrine, :count).by(0)
      end

      it "renders a JSON response with errors for the new vitrine" do
        post vitrines_url,
             params: { vitrine: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested vitrine" do
        vitrine = Vitrine.create! valid_attributes
        patch vitrine_url(vitrine),
              params: { vitrine: new_attributes }, headers: valid_headers, as: :json
        vitrine.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the vitrine" do
        vitrine = Vitrine.create! valid_attributes
        patch vitrine_url(vitrine),
              params: { vitrine: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the vitrine" do
        vitrine = Vitrine.create! valid_attributes
        patch vitrine_url(vitrine),
              params: { vitrine: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested vitrine" do
      vitrine = Vitrine.create! valid_attributes
      expect {
        delete vitrine_url(vitrine), headers: valid_headers, as: :json
      }.to change(Vitrine, :count).by(-1)
    end
  end
end
