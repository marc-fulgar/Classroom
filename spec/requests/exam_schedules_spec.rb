require 'rails_helper'

RSpec.describe "ExamSchedules", type: :request do
  describe "GET /exam_schedules" do
    it "works! (now write some real specs)" do
      get exam_schedules_path
      expect(response).to have_http_status(200)
    end
  end
end
