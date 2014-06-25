require 'rails_helper'

RSpec.describe "AcceptableContactPositions", :type => :request do
  describe "GET /acceptable_contact_positions" do
    it "works! (now write some real specs)" do
      get acceptable_contact_positions_path
      expect(response.status).to be(200)
    end
  end
end
