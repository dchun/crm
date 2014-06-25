require "rails_helper"

RSpec.describe AcceptableContactPositionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/acceptable_contact_positions").to route_to("acceptable_contact_positions#index")
    end

    it "routes to #new" do
      expect(:get => "/acceptable_contact_positions/new").to route_to("acceptable_contact_positions#new")
    end

    it "routes to #show" do
      expect(:get => "/acceptable_contact_positions/1").to route_to("acceptable_contact_positions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/acceptable_contact_positions/1/edit").to route_to("acceptable_contact_positions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/acceptable_contact_positions").to route_to("acceptable_contact_positions#create")
    end

    it "routes to #update" do
      expect(:put => "/acceptable_contact_positions/1").to route_to("acceptable_contact_positions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/acceptable_contact_positions/1").to route_to("acceptable_contact_positions#destroy", :id => "1")
    end

  end
end
