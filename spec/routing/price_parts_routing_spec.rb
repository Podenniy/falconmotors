require "spec_helper"

describe PricePartsController do
  describe "routing" do

    it "routes to #index" do
      get("/price_parts").should route_to("price_parts#index")
    end

    it "routes to #new" do
      get("/price_parts/new").should route_to("price_parts#new")
    end

    it "routes to #show" do
      get("/price_parts/1").should route_to("price_parts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/price_parts/1/edit").should route_to("price_parts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/price_parts").should route_to("price_parts#create")
    end

    it "routes to #update" do
      put("/price_parts/1").should route_to("price_parts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/price_parts/1").should route_to("price_parts#destroy", :id => "1")
    end

  end
end
