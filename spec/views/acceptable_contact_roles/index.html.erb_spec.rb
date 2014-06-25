require 'rails_helper'

RSpec.describe "acceptable_contact_roles/index", :type => :view do
  before(:each) do
    assign(:acceptable_contact_roles, [
      AcceptableContactRole.create!(
        :role => "Role"
      ),
      AcceptableContactRole.create!(
        :role => "Role"
      )
    ])
  end

  it "renders a list of acceptable_contact_roles" do
    render
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
