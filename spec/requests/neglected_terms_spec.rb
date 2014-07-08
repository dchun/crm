require 'rails_helper'

RSpec.describe "NeglectedTerms", :type => :request do
  describe "GET /neglected_terms" do
    it "works! (now write some real specs)" do
      get neglected_terms_path
      expect(response.status).to be(200)
    end
  end
end
