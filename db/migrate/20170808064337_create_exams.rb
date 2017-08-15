class CreateExams < ActiveRecord::Migration[5.1]
  def change
    create_table :exams do |t|
      t.integer :grade
      t.integer :exam_schedule_id
      t.integer :student_id
      t.string :remarks
      t.datetime :date_taken
      t.integer :max_score

      t.timestamps
    end
  end
end
