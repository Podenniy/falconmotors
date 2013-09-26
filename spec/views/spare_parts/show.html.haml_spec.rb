require 'spec_helper'

describe "spare_parts/show" do
  before(:each) do
    @spare_part = assign(:spare_part, stub_model(SparePart,
      :title => "Title",
      :descriptions => "MyText",
      :image_url => "Image Url",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Image Url/)
    rendered.should match(/9.99/)
  end
end
