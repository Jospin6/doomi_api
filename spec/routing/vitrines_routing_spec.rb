require "rails_helper"

RSpec.describe VitrinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/vitrines").to route_to("vitrines#index")
    end

    it "routes to #show" do
      expect(get: "/vitrines/1").to route_to("vitrines#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/vitrines").to route_to("vitrines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/vitrines/1").to route_to("vitrines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/vitrines/1").to route_to("vitrines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/vitrines/1").to route_to("vitrines#destroy", id: "1")
    end
  end
end
