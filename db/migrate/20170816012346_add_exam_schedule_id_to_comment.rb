class AddExamScheduleIdToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :exam_schedule_id, :integer
  end
end
