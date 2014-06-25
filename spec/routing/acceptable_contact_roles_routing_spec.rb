require "rails_helper"

RSpec.describe AcceptableContactRolesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/acceptable_contact_roles").to route_to("acceptable_contact_roles#index")
    end

    it "routes to #new" do
      expect(:get => "/acceptable_contact_roles/new").to route_to("acceptable_contact_roles#new")
    end

    it "routes to #show" do
      expect(:get => "/acceptable_contact_roles/1").to route_to("acceptable_contact_roles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/acceptable_contact_roles/1/edit").to route_to("acceptable_contact_roles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/acceptable_contact_roles").to route_to("acceptable_contact_roles#create")
    end

    it "routes to #update" do
      expect(:put => "/acceptable_contact_roles/1").to route_to("acceptable_contact_roles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/acceptable_contact_roles/1").to route_to("acceptable_contact_roles#destroy", :id => "1")
    end

  end
end
