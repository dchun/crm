require 'rails_helper'

RSpec.describe "neglected_terms/index", :type => :view do
  before(:each) do
    assign(:neglected_terms, [
      NeglectedTerm.create!(
        :exclude => "Exclude"
      ),
      NeglectedTerm.create!(
        :exclude => "Exclude"
      )
    ])
  end

  it "renders a list of neglected_terms" do
    render
    assert_select "tr>td", :text => "Exclude".to_s, :count => 2
  end
end
