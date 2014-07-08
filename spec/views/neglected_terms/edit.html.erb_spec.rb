require 'rails_helper'

RSpec.describe "neglected_terms/edit", :type => :view do
  before(:each) do
    @neglected_term = assign(:neglected_term, NeglectedTerm.create!(
      :exclude => "MyString"
    ))
  end

  it "renders the edit neglected_term form" do
    render

    assert_select "form[action=?][method=?]", neglected_term_path(@neglected_term), "post" do

      assert_select "input#neglected_term_exclude[name=?]", "neglected_term[exclude]"
    end
  end
end
