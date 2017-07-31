require "rails_helper"

RSpec.describe BlockClassesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/block_classes").to route_to("block_classes#index")
    end

    it "routes to #new" do
      expect(:get => "/block_classes/new").to route_to("block_classes#new")
    end

    it "routes to #show" do
      expect(:get => "/block_classes/1").to route_to("block_classes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/block_classes/1/edit").to route_to("block_classes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/block_classes").to route_to("block_classes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/block_classes/1").to route_to("block_classes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/block_classes/1").to route_to("block_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/block_classes/1").to route_to("block_classes#destroy", :id => "1")
    end

  end
end
