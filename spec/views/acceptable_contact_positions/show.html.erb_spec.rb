require 'rails_helper'

RSpec.describe "acceptable_contact_positions/show", :type => :view do
  before(:each) do
    @acceptable_contact_position = assign(:acceptable_contact_position, AcceptableContactPosition.create!(
      :position => "Position"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Position/)
  end
end
