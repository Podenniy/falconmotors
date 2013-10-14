require 'spec_helper'

describe "suppliers/new" do
  before(:each) do
    assign(:supplier, stub_model(Supplier,
      :price => "9.99",
      :quantity => 1,
      :delivery => 1
    ).as_new_record)
  end

  it "renders new supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suppliers_path, "post" do
      assert_select "input#supplier_price[name=?]", "supplier[price]"
      assert_select "input#supplier_quantity[name=?]", "supplier[quantity]"
      assert_select "input#supplier_delivery[name=?]", "supplier[delivery]"
    end
  end
end
