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

RSpec.describe "/notes_vitrines", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # NotesVitrine. As you add validations to NotesVitrine, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # NotesVitrinesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

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
