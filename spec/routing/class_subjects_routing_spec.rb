require "rails_helper"

RSpec.describe ClassSubjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/class_subjects").to route_to("class_subjects#index")
    end

    it "routes to #new" do
      expect(:get => "/class_subjects/new").to route_to("class_subjects#new")
    end

    it "routes to #show" do
      expect(:get => "/class_subjects/1").to route_to("class_subjects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/class_subjects/1/edit").to route_to("class_subjects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/class_subjects").to route_to("class_subjects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/class_subjects/1").to route_to("class_subjects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/class_subjects/1").to route_to("class_subjects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/class_subjects/1").to route_to("class_subjects#destroy", :id => "1")
    end

  end
end
