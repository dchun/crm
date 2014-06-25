require 'rails_helper'

RSpec.describe "AcceptableContactSalutations", :type => :request do
  describe "GET /acceptable_contact_salutations" do
    it "works! (now write some real specs)" do
      get acceptable_contact_salutations_path
      expect(response.status).to be(200)
    end
  end
end
