require "rails_helper"

RSpec.describe FavorieProduitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/favorie_produits").to route_to("favorie_produits#index")
    end

    it "routes to #show" do
      expect(get: "/favorie_produits/1").to route_to("favorie_produits#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/favorie_produits").to route_to("favorie_produits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/favorie_produits/1").to route_to("favorie_produits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/favorie_produits/1").to route_to("favorie_produits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/favorie_produits/1").to route_to("favorie_produits#destroy", id: "1")
    end
  end
end
