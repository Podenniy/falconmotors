require 'spec_helper'

describe "price_parts/show" do
  before(:each) do
    @price_part = assign(:price_part, stub_model(PricePart,
      :price => "9.99",
      :delivery => 1,
      :quantity => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
