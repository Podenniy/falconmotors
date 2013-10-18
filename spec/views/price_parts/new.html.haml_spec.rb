require 'spec_helper'

describe "price_parts/new" do
  before(:each) do
    assign(:price_part, stub_model(PricePart,
      :price => "9.99",
      :delivery => 1,
      :quantity => 1
    ).as_new_record)
  end

  it "renders new price_part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", price_parts_path, "post" do
      assert_select "input#price_part_price[name=?]", "price_part[price]"
      assert_select "input#price_part_delivery[name=?]", "price_part[delivery]"
      assert_select "input#price_part_quantity[name=?]", "price_part[quantity]"
    end
  end
end
