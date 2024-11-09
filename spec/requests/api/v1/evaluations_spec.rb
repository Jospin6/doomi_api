require 'rails_helper'


RSpec.describe "/evaluations", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # EvaluationsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Evaluation.create! valid_attributes
      get evaluations_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      evaluation = Evaluation.create! valid_attributes
      get evaluation_url(evaluation), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Evaluation" do
        expect {
          post evaluations_url,
               params: { evaluation: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Evaluation, :count).by(1)
      end

      it "renders a JSON response with the new evaluation" do
        post evaluations_url,
             params: { evaluation: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Evaluation" do
        expect {
          post evaluations_url,
               params: { evaluation: invalid_attributes }, as: :json
        }.to change(Evaluation, :count).by(0)
      end

      it "renders a JSON response with errors for the new evaluation" do
        post evaluations_url,
             params: { evaluation: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested evaluation" do
        evaluation = Evaluation.create! valid_attributes
        patch evaluation_url(evaluation),
              params: { evaluation: new_attributes }, headers: valid_headers, as: :json
        evaluation.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the evaluation" do
        evaluation = Evaluation.create! valid_attributes
        patch evaluation_url(evaluation),
              params: { evaluation: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the evaluation" do
        evaluation = Evaluation.create! valid_attributes
        patch evaluation_url(evaluation),
              params: { evaluation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested evaluation" do
      evaluation = Evaluation.create! valid_attributes
      expect {
        delete evaluation_url(evaluation), headers: valid_headers, as: :json
      }.to change(Evaluation, :count).by(-1)
    end
  end
end
