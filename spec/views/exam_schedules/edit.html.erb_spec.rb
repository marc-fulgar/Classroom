require 'rails_helper'

RSpec.describe "exam_schedules/edit", type: :view do
  before(:each) do
    @exam_schedule = assign(:exam_schedule, ExamSchedule.create!())
  end

  it "renders the edit exam_schedule form" do
    render

    assert_select "form[action=?][method=?]", exam_schedule_path(@exam_schedule), "post" do
    end
  end
end
