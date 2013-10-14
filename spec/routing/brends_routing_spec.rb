require "spec_helper"

describe BrendsController do
  describe "routing" do

    it "routes to #index" do
      get("/brends").should route_to("brends#index")
    end

    it "routes to #new" do
      get("/brends/new").should route_to("brends#new")
    end

    it "routes to #show" do
      get("/brends/1").should route_to("brends#show", :id => "1")
    end

    it "routes to #edit" do
      get("/brends/1/edit").should route_to("brends#edit", :id => "1")
    end

    it "routes to #create" do
      post("/brends").should route_to("brends#create")
    end

    it "routes to #update" do
      put("/brends/1").should route_to("brends#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/brends/1").should route_to("brends#destroy", :id => "1")
    end

  end
end
