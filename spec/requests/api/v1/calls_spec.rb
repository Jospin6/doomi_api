require 'rails_helper'

RSpec.describe "api/v1/calls", type: :request do
  
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
      Call.create! valid_attributes
      get calls_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      call = Call.create! valid_attributes
      get call_url(call), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Call" do
        expect {
          post calls_url,
               params: { call: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Call, :count).by(1)
      end

      it "renders a JSON response with the new call" do
        post calls_url,
             params: { call: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Call" do
        expect {
          post calls_url,
               params: { call: invalid_attributes }, as: :json
        }.to change(Call, :count).by(0)
      end

      it "renders a JSON response with errors for the new call" do
        post calls_url,
             params: { call: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested call" do
        call = Call.create! valid_attributes
        patch call_url(call),
              params: { call: new_attributes }, headers: valid_headers, as: :json
        call.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the call" do
        call = Call.create! valid_attributes
        patch call_url(call),
              params: { call: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the call" do
        call = Call.create! valid_attributes
        patch call_url(call),
              params: { call: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested call" do
      call = Call.create! valid_attributes
      expect {
        delete call_url(call), headers: valid_headers, as: :json
      }.to change(Call, :count).by(-1)
    end
  end
end
