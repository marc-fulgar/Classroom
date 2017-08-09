class AddMaxScoreToExamSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :exam_schedules, :max_score, :integer
  end
end
