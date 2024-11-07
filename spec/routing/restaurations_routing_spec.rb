require "rails_helper"

RSpec.describe RestaurationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/restaurations").to route_to("restaurations#index")
    end

    it "routes to #show" do
      expect(get: "/restaurations/1").to route_to("restaurations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/restaurations").to route_to("restaurations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/restaurations/1").to route_to("restaurations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/restaurations/1").to route_to("restaurations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/restaurations/1").to route_to("restaurations#destroy", id: "1")
    end
  end
end
