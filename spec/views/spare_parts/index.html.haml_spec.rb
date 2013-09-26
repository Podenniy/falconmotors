require 'spec_helper'

describe "spare_parts/index" do
  before(:each) do
    assign(:spare_parts, [
      stub_model(SparePart,
        :title => "Title",
        :descriptions => "MyText",
        :image_url => "Image Url",
        :price => "9.99"
      ),
      stub_model(SparePart,
        :title => "Title",
        :descriptions => "MyText",
        :image_url => "Image Url",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of spare_parts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
