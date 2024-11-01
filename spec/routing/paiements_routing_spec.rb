require "rails_helper"

RSpec.describe PaiementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/paiements").to route_to("paiements#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/paiements/1").to route_to("paiements#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/paiements").to route_to("paiements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/paiements/1").to route_to("paiements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/paiements/1").to route_to("paiements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/paiements/1").to route_to("paiements#destroy", id: "1")
    end
  end
end
