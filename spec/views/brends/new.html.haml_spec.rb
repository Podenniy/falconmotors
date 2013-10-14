require 'spec_helper'

describe "brends/new" do
  before(:each) do
    assign(:brend, stub_model(Brend,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new brend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brends_path, "post" do
      assert_select "input#brend_title[name=?]", "brend[title]"
      assert_select "textarea#brend_description[name=?]", "brend[description]"
    end
  end
end
