require 'rails_helper'

RSpec.describe "equivalent_terms/edit", :type => :view do
  before(:each) do
    @equivalent_term = assign(:equivalent_term, EquivalentTerm.create!(
      :input => "MyString",
      :output => "MyString"
    ))
  end

  it "renders the edit equivalent_term form" do
    render

    assert_select "form[action=?][method=?]", equivalent_term_path(@equivalent_term), "post" do

      assert_select "input#equivalent_term_input[name=?]", "equivalent_term[input]"

      assert_select "input#equivalent_term_output[name=?]", "equivalent_term[output]"
    end
  end
end
