require 'spec_helper'

describe "price_parts/edit" do
  before(:each) do
    @price_part = assign(:price_part, stub_model(PricePart,
      :price => "9.99",
      :delivery => 1,
      :quantity => 1
    ))
  end

  it "renders the edit price_part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", price_part_path(@price_part), "post" do
      assert_select "input#price_part_price[name=?]", "price_part[price]"
      assert_select "input#price_part_delivery[name=?]", "price_part[delivery]"
      assert_select "input#price_part_quantity[name=?]", "price_part[quantity]"
    end
  end
end
