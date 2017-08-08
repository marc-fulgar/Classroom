require 'rails_helper'

RSpec.describe "exam_schedules/index", type: :view do
  before(:each) do
    assign(:exam_schedules, [
      ExamSchedule.create!(),
      ExamSchedule.create!()
    ])
  end

  it "renders a list of exam_schedules" do
    render
  end
end
