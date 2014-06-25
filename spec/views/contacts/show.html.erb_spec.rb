require 'rails_helper'

RSpec.describe "contacts/show", :type => :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :fname => "Fname",
      :lname => "Lname",
      :email => "Email",
      :salutation => "Salutation",
      :position => "Position",
      :role => "Role",
      :complete => false,
      :school => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fname/)
    expect(rendered).to match(/Lname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Salutation/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
