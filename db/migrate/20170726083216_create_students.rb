class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :year_level
      t.integer :course_id

      t.timestamps
    end
  end
end
