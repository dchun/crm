require 'rails_helper'

RSpec.describe "acceptable_contact_positions/edit", :type => :view do
  before(:each) do
    @acceptable_contact_position = assign(:acceptable_contact_position, AcceptableContactPosition.create!(
      :position => "MyString"
    ))
  end

  it "renders the edit acceptable_contact_position form" do
    render

    assert_select "form[action=?][method=?]", acceptable_contact_position_path(@acceptable_contact_position), "post" do

      assert_select "input#acceptable_contact_position_position[name=?]", "acceptable_contact_position[position]"
    end
  end
end
