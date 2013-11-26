require "spec_helper"

describe VinCodsController do
  describe "routing" do

    it "routes to #index" do
      get("/vin_cods").should route_to("vin_cods#index")
    end

    it "routes to #new" do
      get("/vin_cods/new").should route_to("vin_cods#new")
    end

    it "routes to #show" do
      get("/vin_cods/1").should route_to("vin_cods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vin_cods/1/edit").should route_to("vin_cods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vin_cods").should route_to("vin_cods#create")
    end

    it "routes to #update" do
      put("/vin_cods/1").should route_to("vin_cods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vin_cods/1").should route_to("vin_cods#destroy", :id => "1")
    end

  end
end
