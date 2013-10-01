require 'spec_helper'

describe "line_items/edit" do
  before(:each) do
    @line_item = assign(:line_item, stub_model(LineItem,
      :spare_part_id => 1,
      :cart_id => 1
    ))
  end

  it "renders the edit line_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", line_item_path(@line_item), "post" do
      assert_select "input#line_item_spare_part_id[name=?]", "line_item[spare_part_id]"
      assert_select "input#line_item_cart_id[name=?]", "line_item[cart_id]"
    end
  end
end
