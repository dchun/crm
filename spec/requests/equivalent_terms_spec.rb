require 'rails_helper'

RSpec.describe "EquivalentTerms", :type => :request do
  describe "GET /equivalent_terms" do
    it "works! (now write some real specs)" do
      get equivalent_terms_path
      expect(response.status).to be(200)
    end
  end
end
