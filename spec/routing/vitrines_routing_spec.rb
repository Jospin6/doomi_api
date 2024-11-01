require "rails_helper"

RSpec.describe VitrinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/vitrines").to route_to("vitrines#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/vitrines/1").to route_to("vitrines#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/vitrines").to route_to("vitrines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/vitrines/1").to route_to("vitrines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/vitrines/1").to route_to("vitrines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/vitrines/1").to route_to("vitrines#destroy", id: "1")
    end
  end
end
