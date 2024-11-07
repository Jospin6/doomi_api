require "rails_helper"

RSpec.describe SericesDisponibleHotelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/serices_disponible_hotels").to route_to("serices_disponible_hotels#index")
    end

    it "routes to #show" do
      expect(get: "/serices_disponible_hotels/1").to route_to("serices_disponible_hotels#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/serices_disponible_hotels").to route_to("serices_disponible_hotels#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/serices_disponible_hotels/1").to route_to("serices_disponible_hotels#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/serices_disponible_hotels/1").to route_to("serices_disponible_hotels#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/serices_disponible_hotels/1").to route_to("serices_disponible_hotels#destroy", id: "1")
    end
  end
end
