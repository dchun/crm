require 'rails_helper'

RSpec.describe "neglected_terms/show", :type => :view do
  before(:each) do
    @neglected_term = assign(:neglected_term, NeglectedTerm.create!(
      :exclude => "Exclude"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Exclude/)
  end
end
