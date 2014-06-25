require 'rails_helper'

RSpec.describe "districts/index", :type => :view do
  before(:each) do
    assign(:districts, [
      District.create!(
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
      ),
      District.create!(
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
      )
    ])
  end

  it "renders a list of districts" do
    render
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
