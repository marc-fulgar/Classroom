class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :course
      t.integer :year_level

      t.timestamps
    end
  end
end
