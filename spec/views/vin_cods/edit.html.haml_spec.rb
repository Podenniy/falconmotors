require 'spec_helper'

describe "vin_cods/edit" do
  before(:each) do
    @vin_cod = assign(:vin_cod, stub_model(VinCod,
      :brend_avto => "MyString",
      :model => "MyString",
      :year => "MyString",
      :volume => "MyString",
      :code => "MyString",
      :parts_list => "MyText"
    ))
  end

  it "renders the edit vin_cod form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vin_cod_path(@vin_cod), "post" do
      assert_select "input#vin_cod_brend_avto[name=?]", "vin_cod[brend_avto]"
      assert_select "input#vin_cod_model[name=?]", "vin_cod[model]"
      assert_select "input#vin_cod_year[name=?]", "vin_cod[year]"
      assert_select "input#vin_cod_volume[name=?]", "vin_cod[volume]"
      assert_select "input#vin_cod_code[name=?]", "vin_cod[code]"
      assert_select "textarea#vin_cod_parts_list[name=?]", "vin_cod[parts_list]"
    end
  end
end
