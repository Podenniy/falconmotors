require 'spec_helper'

describe "VinCods" do
  describe "GET /vin_cods" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vin_cods_path
      response.status.should be(200)
    end
  end
end
