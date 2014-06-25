require 'rails_helper'

RSpec.describe "schools/show", :type => :view do
  before(:each) do
    @school = assign(:school, School.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Student Teacher Ratio/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
