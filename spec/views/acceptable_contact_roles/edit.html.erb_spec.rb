require 'rails_helper'

RSpec.describe "acceptable_contact_roles/edit", :type => :view do
  before(:each) do
    @acceptable_contact_role = assign(:acceptable_contact_role, AcceptableContactRole.create!(
      :role => "MyString"
    ))
  end

  it "renders the edit acceptable_contact_role form" do
    render

    assert_select "form[action=?][method=?]", acceptable_contact_role_path(@acceptable_contact_role), "post" do

      assert_select "input#acceptable_contact_role_role[name=?]", "acceptable_contact_role[role]"
    end
  end
end
