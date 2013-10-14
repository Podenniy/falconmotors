require 'spec_helper'

describe "brends/edit" do
  before(:each) do
    @brend = assign(:brend, stub_model(Brend,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit brend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brend_path(@brend), "post" do
      assert_select "input#brend_title[name=?]", "brend[title]"
      assert_select "textarea#brend_description[name=?]", "brend[description]"
    end
  end
end
