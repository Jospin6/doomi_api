require "rails_helper"

RSpec.describe ProduitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/produits").to route_to("produits#index")
    end

    it "routes to #show" do
      expect(get: "/produits/1").to route_to("produits#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/produits").to route_to("produits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/produits/1").to route_to("produits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/produits/1").to route_to("produits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/produits/1").to route_to("produits#destroy", id: "1")
    end
  end
end
