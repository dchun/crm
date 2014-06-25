require 'rails_helper'

RSpec.describe "acceptable_contact_roles/show", :type => :view do
  before(:each) do
    @acceptable_contact_role = assign(:acceptable_contact_role, AcceptableContactRole.create!(
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Role/)
  end
end
