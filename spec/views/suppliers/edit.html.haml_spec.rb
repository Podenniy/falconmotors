require 'spec_helper'

describe "suppliers/edit" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
      :price => "9.99",
      :quantity => 1,
      :delivery => 1
    ))
  end

  it "renders the edit supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do
      assert_select "input#supplier_price[name=?]", "supplier[price]"
      assert_select "input#supplier_quantity[name=?]", "supplier[quantity]"
      assert_select "input#supplier_delivery[name=?]", "supplier[delivery]"
    end
  end
end
