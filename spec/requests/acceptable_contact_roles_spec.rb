require 'rails_helper'

RSpec.describe "AcceptableContactRoles", :type => :request do
  describe "GET /acceptable_contact_roles" do
    it "works! (now write some real specs)" do
      get acceptable_contact_roles_path
      expect(response.status).to be(200)
    end
  end
end
