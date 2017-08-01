class CreateClassSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :class_subjects do |t|
      t.integer :block_class_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
