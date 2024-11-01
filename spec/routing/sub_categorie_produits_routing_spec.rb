require "rails_helper"

RSpec.describe SubCategorieProduitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/v1/sub_categorie_produits").to route_to("sub_categorie_produits#index")
    end

    it "routes to #show" do
      expect(get: "api/v1/sub_categorie_produits/1").to route_to("sub_categorie_produits#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/v1/sub_categorie_produits").to route_to("sub_categorie_produits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/v1/sub_categorie_produits/1").to route_to("sub_categorie_produits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/v1/sub_categorie_produits/1").to route_to("sub_categorie_produits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/v1/sub_categorie_produits/1").to route_to("sub_categorie_produits#destroy", id: "1")
    end
  end
end
