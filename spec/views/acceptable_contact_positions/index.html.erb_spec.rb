require 'rails_helper'

RSpec.describe "acceptable_contact_positions/index", :type => :view do
  before(:each) do
    assign(:acceptable_contact_positions, [
      AcceptableContactPosition.create!(
        :position => "Position"
      ),
      AcceptableContactPosition.create!(
        :position => "Position"
      )
    ])
  end

  it "renders a list of acceptable_contact_positions" do
    render
    assert_select "tr>td", :text => "Position".to_s, :count => 2
  end
end
