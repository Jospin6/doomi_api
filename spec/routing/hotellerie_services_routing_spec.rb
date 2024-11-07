require "rails_helper"

RSpec.describe HotellerieServicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hotellerie_services").to route_to("hotellerie_services#index")
    end

    it "routes to #show" do
      expect(get: "/hotellerie_services/1").to route_to("hotellerie_services#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hotellerie_services").to route_to("hotellerie_services#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hotellerie_services/1").to route_to("hotellerie_services#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hotellerie_services/1").to route_to("hotellerie_services#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hotellerie_services/1").to route_to("hotellerie_services#destroy", id: "1")
    end
  end
end
