require 'rails_helper'

RSpec.describe "equivalent_terms/show", :type => :view do
  before(:each) do
    @equivalent_term = assign(:equivalent_term, EquivalentTerm.create!(
      :input => "Input",
      :output => "Output"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Input/)
    expect(rendered).to match(/Output/)
  end
end
