require "spec_helper"

describe SparePartsController do
  describe "routing" do

    it "routes to #index" do
      get("/spare_parts").should route_to("spare_parts#index")
    end

    it "routes to #new" do
      get("/spare_parts/new").should route_to("spare_parts#new")
    end

    it "routes to #show" do
      get("/spare_parts/1").should route_to("spare_parts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spare_parts/1/edit").should route_to("spare_parts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spare_parts").should route_to("spare_parts#create")
    end

    it "routes to #update" do
      put("/spare_parts/1").should route_to("spare_parts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spare_parts/1").should route_to("spare_parts#destroy", :id => "1")
    end

  end
end
