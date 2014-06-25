require 'rails_helper'

RSpec.describe "acceptable_contact_roles/new", :type => :view do
  before(:each) do
    assign(:acceptable_contact_role, AcceptableContactRole.new(
      :role => "MyString"
    ))
  end

  it "renders new acceptable_contact_role form" do
    render

    assert_select "form[action=?][method=?]", acceptable_contact_roles_path, "post" do

      assert_select "input#acceptable_contact_role_role[name=?]", "acceptable_contact_role[role]"
    end
  end
end
