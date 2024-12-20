require "rails_helper"

RSpec.describe TransactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/transactions").to route_to("transactions#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/transactions/1").to route_to("transactions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/transactions").to route_to("transactions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/transactions/1").to route_to("transactions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/transactions/1").to route_to("transactions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/transactions/1").to route_to("transactions#destroy", id: "1")
    end
  end
end
