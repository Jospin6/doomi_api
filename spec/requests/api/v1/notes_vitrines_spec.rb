require 'swagger_helper'


RSpec.describe "api/v1/notes_vitrines", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      NotesVitrine.create! valid_attributes
      get notes_vitrines_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      notes_vitrine = NotesVitrine.create! valid_attributes
      get notes_vitrine_url(notes_vitrine), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new NotesVitrine" do
        expect {
          post notes_vitrines_url,
               params: { notes_vitrine: valid_attributes }, headers: valid_headers, as: :json
        }.to change(NotesVitrine, :count).by(1)
      end

      it "renders a JSON response with the new notes_vitrine" do
        post notes_vitrines_url,
             params: { notes_vitrine: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new NotesVitrine" do
        expect {
          post notes_vitrines_url,
               params: { notes_vitrine: invalid_attributes }, as: :json
        }.to change(NotesVitrine, :count).by(0)
      end

      it "renders a JSON response with errors for the new notes_vitrine" do
        post notes_vitrines_url,
             params: { notes_vitrine: invalid_attributes }, headers: valid_headers, as: :json
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

      it "updates the requested notes_vitrine" do
        notes_vitrine = NotesVitrine.create! valid_attributes
        patch notes_vitrine_url(notes_vitrine),
              params: { notes_vitrine: new_attributes }, headers: valid_headers, as: :json
        notes_vitrine.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the notes_vitrine" do
        notes_vitrine = NotesVitrine.create! valid_attributes
        patch notes_vitrine_url(notes_vitrine),
              params: { notes_vitrine: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the notes_vitrine" do
        notes_vitrine = NotesVitrine.create! valid_attributes
        patch notes_vitrine_url(notes_vitrine),
              params: { notes_vitrine: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested notes_vitrine" do
      notes_vitrine = NotesVitrine.create! valid_attributes
      expect {
        delete notes_vitrine_url(notes_vitrine), headers: valid_headers, as: :json
      }.to change(NotesVitrine, :count).by(-1)
    end
  end
end
