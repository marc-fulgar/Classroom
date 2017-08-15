class CreateExamSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_schedules do |t|
      t.string :title
      t.string :content
      t.string :remarks
      t.integer :subject_id
      t.datetime :date
      t.integer :max_score

      t.timestamps
    end
  end
end
