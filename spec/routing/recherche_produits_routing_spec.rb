require "rails_helper"

RSpec.describe RechercheProduitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/recherche_produits").to route_to("recherche_produits#index")
    end

    it "routes to #show" do
      expect(get: "/recherche_produits/1").to route_to("recherche_produits#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/recherche_produits").to route_to("recherche_produits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/recherche_produits/1").to route_to("recherche_produits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/recherche_produits/1").to route_to("recherche_produits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/recherche_produits/1").to route_to("recherche_produits#destroy", id: "1")
    end
  end
end
