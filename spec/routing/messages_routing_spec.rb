require "rails_helper"

RSpec.describe MessagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/messages").to route_to("messages#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/messages/1").to route_to("messages#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/messages").to route_to("messages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/messages/1").to route_to("messages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/messages/1").to route_to("messages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/messages/1").to route_to("messages#destroy", id: "1")
    end
  end
end
