require 'rails_helper'

RSpec.describe "contacts/edit", :type => :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
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

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

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
