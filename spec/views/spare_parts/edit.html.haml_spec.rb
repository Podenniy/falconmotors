require 'spec_helper'

describe "spare_parts/edit" do
  before(:each) do
    @spare_part = assign(:spare_part, stub_model(SparePart,
      :title => "MyString",
      :descriptions => "MyText",
      :image_url => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit spare_part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spare_part_path(@spare_part), "post" do
      assert_select "input#spare_part_title[name=?]", "spare_part[title]"
      assert_select "textarea#spare_part_descriptions[name=?]", "spare_part[descriptions]"
      assert_select "input#spare_part_image_url[name=?]", "spare_part[image_url]"
      assert_select "input#spare_part_price[name=?]", "spare_part[price]"
    end
  end
end
