require 'rails_helper'

RSpec.describe "districts/new", :type => :view do
  before(:each) do
    assign(:district, District.new(
      :state => "MyString",
      :name => "MyString",
      :college_readiness_score => 1.5,
      :tested_ap => 1.5,
      :passed_ap => 1.5,
      :math_score => 1.5,
      :math_proficient => 1.5,
      :math_not_proficient => 1.5,
      :reading_score => 1.5,
      :reading_proficient => 1.5,
      :reading_not_proficient => 1.5
    ))
  end

  it "renders new district form" do
    render

    assert_select "form[action=?][method=?]", districts_path, "post" do

      assert_select "input#district_state[name=?]", "district[state]"

      assert_select "input#district_name[name=?]", "district[name]"

      assert_select "input#district_college_readiness_score[name=?]", "district[college_readiness_score]"

      assert_select "input#district_tested_ap[name=?]", "district[tested_ap]"

      assert_select "input#district_passed_ap[name=?]", "district[passed_ap]"

      assert_select "input#district_math_score[name=?]", "district[math_score]"

      assert_select "input#district_math_proficient[name=?]", "district[math_proficient]"

      assert_select "input#district_math_not_proficient[name=?]", "district[math_not_proficient]"

      assert_select "input#district_reading_score[name=?]", "district[reading_score]"

      assert_select "input#district_reading_proficient[name=?]", "district[reading_proficient]"

      assert_select "input#district_reading_not_proficient[name=?]", "district[reading_not_proficient]"
    end
  end
end
