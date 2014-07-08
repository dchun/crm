require "rails_helper"

RSpec.describe EquivalentTermsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/equivalent_terms").to route_to("equivalent_terms#index")
    end

    it "routes to #new" do
      expect(:get => "/equivalent_terms/new").to route_to("equivalent_terms#new")
    end

    it "routes to #show" do
      expect(:get => "/equivalent_terms/1").to route_to("equivalent_terms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/equivalent_terms/1/edit").to route_to("equivalent_terms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/equivalent_terms").to route_to("equivalent_terms#create")
    end

    it "routes to #update" do
      expect(:put => "/equivalent_terms/1").to route_to("equivalent_terms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/equivalent_terms/1").to route_to("equivalent_terms#destroy", :id => "1")
    end

  end
end
