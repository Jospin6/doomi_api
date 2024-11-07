require "rails_helper"

RSpec.describe ServicesDisponibleHotelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/services_disponible_hotels").to route_to("services_disponible_hotels#index")
    end

    it "routes to #show" do
      expect(get: "/services_disponible_hotels/1").to route_to("services_disponible_hotels#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/services_disponible_hotels").to route_to("services_disponible_hotels#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/services_disponible_hotels/1").to route_to("services_disponible_hotels#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/services_disponible_hotels/1").to route_to("services_disponible_hotels#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/services_disponible_hotels/1").to route_to("services_disponible_hotels#destroy", id: "1")
    end
  end
end
