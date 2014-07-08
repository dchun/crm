require 'rails_helper'

RSpec.describe "neglected_terms/new", :type => :view do
  before(:each) do
    assign(:neglected_term, NeglectedTerm.new(
      :exclude => "MyString"
    ))
  end

  it "renders new neglected_term form" do
    render

    assert_select "form[action=?][method=?]", neglected_terms_path, "post" do

      assert_select "input#neglected_term_exclude[name=?]", "neglected_term[exclude]"
    end
  end
end
