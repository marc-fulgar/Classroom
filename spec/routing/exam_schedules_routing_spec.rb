require "rails_helper"

RSpec.describe ExamSchedulesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/exam_schedules").to route_to("exam_schedules#index")
    end

    it "routes to #new" do
      expect(:get => "/exam_schedules/new").to route_to("exam_schedules#new")
    end

    it "routes to #show" do
      expect(:get => "/exam_schedules/1").to route_to("exam_schedules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/exam_schedules/1/edit").to route_to("exam_schedules#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/exam_schedules").to route_to("exam_schedules#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/exam_schedules/1").to route_to("exam_schedules#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/exam_schedules/1").to route_to("exam_schedules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exam_schedules/1").to route_to("exam_schedules#destroy", :id => "1")
    end

  end
end
