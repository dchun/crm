require 'rails_helper'

RSpec.describe "acceptable_contact_salutations/show", :type => :view do
  before(:each) do
    @acceptable_contact_salutation = assign(:acceptable_contact_salutation, AcceptableContactSalutation.create!(
      :salutation => "Salutation"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Salutation/)
  end
end
