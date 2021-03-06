require 'spec_helper'

describe "spare_parts/new" do
  before(:each) do
    assign(:spare_part, stub_model(SparePart,
      :title => "MyString",
      :descriptions => "MyText",
      :image_url => "MyString",
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new spare_part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spare_parts_path, "post" do
      assert_select "input#spare_part_title[name=?]", "spare_part[title]"
      assert_select "textarea#spare_part_descriptions[name=?]", "spare_part[descriptions]"
      assert_select "input#spare_part_image_url[name=?]", "spare_part[image_url]"
      assert_select "input#spare_part_price[name=?]", "spare_part[price]"
    end
  end
end
