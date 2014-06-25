require 'rails_helper'

RSpec.describe "acceptable_contact_salutations/new", :type => :view do
  before(:each) do
    assign(:acceptable_contact_salutation, AcceptableContactSalutation.new(
      :salutation => "MyString"
    ))
  end

  it "renders new acceptable_contact_salutation form" do
    render

    assert_select "form[action=?][method=?]", acceptable_contact_salutations_path, "post" do

      assert_select "input#acceptable_contact_salutation_salutation[name=?]", "acceptable_contact_salutation[salutation]"
    end
  end
end
