require 'rails_helper'

RSpec.describe "acceptable_contact_salutations/edit", :type => :view do
  before(:each) do
    @acceptable_contact_salutation = assign(:acceptable_contact_salutation, AcceptableContactSalutation.create!(
      :salutation => "MyString"
    ))
  end

  it "renders the edit acceptable_contact_salutation form" do
    render

    assert_select "form[action=?][method=?]", acceptable_contact_salutation_path(@acceptable_contact_salutation), "post" do

      assert_select "input#acceptable_contact_salutation_salutation[name=?]", "acceptable_contact_salutation[salutation]"
    end
  end
end
