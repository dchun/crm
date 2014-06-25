require 'rails_helper'

RSpec.describe "contacts/index", :type => :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :fname => "Fname",
        :lname => "Lname",
        :email => "Email",
        :salutation => "Salutation",
        :position => "Position",
        :role => "Role",
        :complete => false,
        :school => nil
      ),
      Contact.create!(
        :fname => "Fname",
        :lname => "Lname",
        :email => "Email",
        :salutation => "Salutation",
        :position => "Position",
        :role => "Role",
        :complete => false,
        :school => nil
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Salutation".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
