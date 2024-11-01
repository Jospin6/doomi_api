require "rails_helper"

RSpec.describe NotesVitrinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/notes_vitrines").to route_to("notes_vitrines#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/notes_vitrines/1").to route_to("notes_vitrines#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/notes_vitrines").to route_to("notes_vitrines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/notes_vitrines/1").to route_to("notes_vitrines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/notes_vitrines/1").to route_to("notes_vitrines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/notes_vitrines/1").to route_to("notes_vitrines#destroy", id: "1")
    end
  end
end
