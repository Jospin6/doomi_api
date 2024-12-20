require "rails_helper"

RSpec.describe FollowersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/followers").to route_to("followers#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/followers/1").to route_to("followers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/followers").to route_to("followers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/followers/1").to route_to("followers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/followers/1").to route_to("followers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/followers/1").to route_to("followers#destroy", id: "1")
    end
  end
end
