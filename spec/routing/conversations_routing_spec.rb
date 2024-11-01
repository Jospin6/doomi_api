require "rails_helper"

RSpec.describe ConversationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/conversations").to route_to("conversations#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/conversations/1").to route_to("conversations#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/conversations").to route_to("conversations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/conversations/1").to route_to("conversations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/conversations/1").to route_to("conversations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/conversations/1").to route_to("conversations#destroy", id: "1")
    end
  end
end
