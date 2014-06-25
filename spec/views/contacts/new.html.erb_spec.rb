require 'rails_helper'

RSpec.describe "contacts/new", :type => :view do
  before(:each) do
    assign(:contact, Contact.new(
      :fname => "MyString",
      :lname => "MyString",
      :email => "MyString",
      :salutation => "MyString",
      :position => "MyString",
      :role => "MyString",
      :complete => false,
      :school => nil
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_fname[name=?]", "contact[fname]"

      assert_select "input#contact_lname[name=?]", "contact[lname]"

      assert_select "input#contact_email[name=?]", "contact[email]"

      assert_select "input#contact_salutation[name=?]", "contact[salutation]"

      assert_select "input#contact_position[name=?]", "contact[position]"

      assert_select "input#contact_role[name=?]", "contact[role]"

      assert_select "input#contact_complete[name=?]", "contact[complete]"

      assert_select "input#contact_school_id[name=?]", "contact[school_id]"
    end
  end
end
