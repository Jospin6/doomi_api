require "rails_helper"

RSpec.describe CategorieProduitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/categorie_produits").to route_to("categorie_produits#index")
    end

    it "routes to #show" do
      expect(get: "/categorie_produits/1").to route_to("categorie_produits#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/categorie_produits").to route_to("categorie_produits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/categorie_produits/1").to route_to("categorie_produits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/categorie_produits/1").to route_to("categorie_produits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/categorie_produits/1").to route_to("categorie_produits#destroy", id: "1")
    end
  end
end
