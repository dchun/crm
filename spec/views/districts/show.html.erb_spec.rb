require 'rails_helper'

RSpec.describe "districts/show", :type => :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :state => "State",
      :name => "Name",
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
