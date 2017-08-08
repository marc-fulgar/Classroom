require 'rails_helper'

RSpec.describe "exam_schedules/show", type: :view do
  before(:each) do
    @exam_schedule = assign(:exam_schedule, ExamSchedule.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
