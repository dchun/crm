require 'rails_helper'

RSpec.describe "schools/index", :type => :view do
  before(:each) do
    assign(:schools, [
      School.create!(
        :name => "Name",
        :state_rank => 1,
        :national_rank => 2,
        :college_readiness_score => 1.5,
        :tested_ap_ib => 1.5,
        :pass_ap_ib => 1.5,
        :math_score => 1.5,
        :math_proficient => 1.5,
        :math_not_proficient => 1.5,
        :reading_score => 1.5,
        :reading_proficient => 1.5,
        :reading_not_proficient => 1.5,
        :student_teacher_ratio => "Student Teacher Ratio",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :latitude => 1.5,
        :longitude => 1.5,
        :total_enrollment => 3,
        :total_economically_disadvantaged => 1.5,
        :receives_title_i_funding => false,
        :ap_student_performance_participation_rate => 1.5,
        :ap_student_performance_participant_passing_rate => 1.5,
        :ap_student_performance_exam_per_test_taker => 1.5,
        :ap_student_performance_exam_pass_rate => 1.5,
        :district => nil
      ),
      School.create!(
        :name => "Name",
        :state_rank => 1,
        :national_rank => 2,
        :college_readiness_score => 1.5,
        :tested_ap_ib => 1.5,
        :pass_ap_ib => 1.5,
        :math_score => 1.5,
        :math_proficient => 1.5,
        :math_not_proficient => 1.5,
        :reading_score => 1.5,
        :reading_proficient => 1.5,
        :reading_not_proficient => 1.5,
        :student_teacher_ratio => "Student Teacher Ratio",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :latitude => 1.5,
        :longitude => 1.5,
        :total_enrollment => 3,
        :total_economically_disadvantaged => 1.5,
        :receives_title_i_funding => false,
        :ap_student_performance_participation_rate => 1.5,
        :ap_student_performance_participant_passing_rate => 1.5,
        :ap_student_performance_exam_per_test_taker => 1.5,
        :ap_student_performance_exam_pass_rate => 1.5,
        :district => nil
      )
    ])
  end

  it "renders a list of schools" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Student Teacher Ratio".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
