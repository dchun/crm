require "rails_helper"

RSpec.describe AcceptableContactSalutationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/acceptable_contact_salutations").to route_to("acceptable_contact_salutations#index")
    end

    it "routes to #new" do
      expect(:get => "/acceptable_contact_salutations/new").to route_to("acceptable_contact_salutations#new")
    end

    it "routes to #show" do
      expect(:get => "/acceptable_contact_salutations/1").to route_to("acceptable_contact_salutations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/acceptable_contact_salutations/1/edit").to route_to("acceptable_contact_salutations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/acceptable_contact_salutations").to route_to("acceptable_contact_salutations#create")
    end

    it "routes to #update" do
      expect(:put => "/acceptable_contact_salutations/1").to route_to("acceptable_contact_salutations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/acceptable_contact_salutations/1").to route_to("acceptable_contact_salutations#destroy", :id => "1")
    end

  end
end
