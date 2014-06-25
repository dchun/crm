require 'rails_helper'

RSpec.describe "schools/edit", :type => :view do
  before(:each) do
    @school = assign(:school, School.create!(
      :name => "MyString",
      :state_rank => 1,
      :national_rank => 1,
      :college_readiness_score => 1.5,
      :tested_ap_ib => 1.5,
      :pass_ap_ib => 1.5,
      :math_score => 1.5,
      :math_proficient => 1.5,
      :math_not_proficient => 1.5,
      :reading_score => 1.5,
      :reading_proficient => 1.5,
      :reading_not_proficient => 1.5,
      :student_teacher_ratio => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :total_enrollment => 1,
      :total_economically_disadvantaged => 1.5,
      :receives_title_i_funding => false,
      :ap_student_performance_participation_rate => 1.5,
      :ap_student_performance_participant_passing_rate => 1.5,
      :ap_student_performance_exam_per_test_taker => 1.5,
      :ap_student_performance_exam_pass_rate => 1.5,
      :district => nil
    ))
  end

  it "renders the edit school form" do
    render

    assert_select "form[action=?][method=?]", school_path(@school), "post" do

      assert_select "input#school_name[name=?]", "school[name]"

      assert_select "input#school_state_rank[name=?]", "school[state_rank]"

      assert_select "input#school_national_rank[name=?]", "school[national_rank]"

      assert_select "input#school_college_readiness_score[name=?]", "school[college_readiness_score]"

      assert_select "input#school_tested_ap_ib[name=?]", "school[tested_ap_ib]"

      assert_select "input#school_pass_ap_ib[name=?]", "school[pass_ap_ib]"

      assert_select "input#school_math_score[name=?]", "school[math_score]"

      assert_select "input#school_math_proficient[name=?]", "school[math_proficient]"

      assert_select "input#school_math_not_proficient[name=?]", "school[math_not_proficient]"

      assert_select "input#school_reading_score[name=?]", "school[reading_score]"

      assert_select "input#school_reading_proficient[name=?]", "school[reading_proficient]"

      assert_select "input#school_reading_not_proficient[name=?]", "school[reading_not_proficient]"

      assert_select "input#school_student_teacher_ratio[name=?]", "school[student_teacher_ratio]"

      assert_select "input#school_street_address[name=?]", "school[street_address]"

      assert_select "input#school_city[name=?]", "school[city]"

      assert_select "input#school_state[name=?]", "school[state]"

      assert_select "input#school_zip[name=?]", "school[zip]"

      assert_select "input#school_latitude[name=?]", "school[latitude]"

      assert_select "input#school_longitude[name=?]", "school[longitude]"

      assert_select "input#school_total_enrollment[name=?]", "school[total_enrollment]"

      assert_select "input#school_total_economically_disadvantaged[name=?]", "school[total_economically_disadvantaged]"

      assert_select "input#school_receives_title_i_funding[name=?]", "school[receives_title_i_funding]"

      assert_select "input#school_ap_student_performance_participation_rate[name=?]", "school[ap_student_performance_participation_rate]"

      assert_select "input#school_ap_student_performance_participant_passing_rate[name=?]", "school[ap_student_performance_participant_passing_rate]"

      assert_select "input#school_ap_student_performance_exam_per_test_taker[name=?]", "school[ap_student_performance_exam_per_test_taker]"

      assert_select "input#school_ap_student_performance_exam_pass_rate[name=?]", "school[ap_student_performance_exam_pass_rate]"

      assert_select "input#school_district_id[name=?]", "school[district_id]"
    end
  end
end
