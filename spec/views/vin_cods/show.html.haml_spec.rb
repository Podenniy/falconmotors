require 'spec_helper'

describe "vin_cods/show" do
  before(:each) do
    @vin_cod = assign(:vin_cod, stub_model(VinCod,
      :brend_avto => "Brend Avto",
      :model => "Model",
      :year => "Year",
      :volume => "Volume",
      :code => "Code",
      :parts_list => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Brend Avto/)
    rendered.should match(/Model/)
    rendered.should match(/Year/)
    rendered.should match(/Volume/)
    rendered.should match(/Code/)
    rendered.should match(/MyText/)
  end
end
