require 'spec_helper'

describe "vin_cods/index" do
  before(:each) do
    assign(:vin_cods, [
      stub_model(VinCod,
        :brend_avto => "Brend Avto",
        :model => "Model",
        :year => "Year",
        :volume => "Volume",
        :code => "Code",
        :parts_list => "MyText"
      ),
      stub_model(VinCod,
        :brend_avto => "Brend Avto",
        :model => "Model",
        :year => "Year",
        :volume => "Volume",
        :code => "Code",
        :parts_list => "MyText"
      )
    ])
  end

  it "renders a list of vin_cods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Brend Avto".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "Volume".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
