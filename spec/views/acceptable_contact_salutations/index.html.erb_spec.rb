require 'rails_helper'

RSpec.describe "acceptable_contact_salutations/index", :type => :view do
  before(:each) do
    assign(:acceptable_contact_salutations, [
      AcceptableContactSalutation.create!(
        :salutation => "Salutation"
      ),
      AcceptableContactSalutation.create!(
        :salutation => "Salutation"
      )
    ])
  end

  it "renders a list of acceptable_contact_salutations" do
    render
    assert_select "tr>td", :text => "Salutation".to_s, :count => 2
  end
end
