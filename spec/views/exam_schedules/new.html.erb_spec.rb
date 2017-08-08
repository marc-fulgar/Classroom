require 'rails_helper'

RSpec.describe "exam_schedules/new", type: :view do
  before(:each) do
    assign(:exam_schedule, ExamSchedule.new())
  end

  it "renders new exam_schedule form" do
    render

    assert_select "form[action=?][method=?]", exam_schedules_path, "post" do
    end
  end
end
