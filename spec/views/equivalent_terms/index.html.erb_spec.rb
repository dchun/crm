require 'rails_helper'

RSpec.describe "equivalent_terms/index", :type => :view do
  before(:each) do
    assign(:equivalent_terms, [
      EquivalentTerm.create!(
        :input => "Input",
        :output => "Output"
      ),
      EquivalentTerm.create!(
        :input => "Input",
        :output => "Output"
      )
    ])
  end

  it "renders a list of equivalent_terms" do
    render
    assert_select "tr>td", :text => "Input".to_s, :count => 2
    assert_select "tr>td", :text => "Output".to_s, :count => 2
  end
end
