require 'spec_helper'

describe "price_parts/index" do
  before(:each) do
    assign(:price_parts, [
      stub_model(PricePart,
        :price => "9.99",
        :delivery => 1,
        :quantity => 2
      ),
      stub_model(PricePart,
        :price => "9.99",
        :delivery => 1,
        :quantity => 2
      )
    ])
  end

  it "renders a list of price_parts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
