require 'rails_helper'

RSpec.describe "equivalent_terms/new", :type => :view do
  before(:each) do
    assign(:equivalent_term, EquivalentTerm.new(
      :input => "MyString",
      :output => "MyString"
    ))
  end

  it "renders new equivalent_term form" do
    render

    assert_select "form[action=?][method=?]", equivalent_terms_path, "post" do

      assert_select "input#equivalent_term_input[name=?]", "equivalent_term[input]"

      assert_select "input#equivalent_term_output[name=?]", "equivalent_term[output]"
    end
  end
end
