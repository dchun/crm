require 'rails_helper'

RSpec.describe "acceptable_contact_positions/new", :type => :view do
  before(:each) do
    assign(:acceptable_contact_position, AcceptableContactPosition.new(
      :position => "MyString"
    ))
  end

  it "renders new acceptable_contact_position form" do
    render

    assert_select "form[action=?][method=?]", acceptable_contact_positions_path, "post" do

      assert_select "input#acceptable_contact_position_position[name=?]", "acceptable_contact_position[position]"
    end
  end
end
