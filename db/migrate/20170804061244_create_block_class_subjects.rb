class CreateBlockClassSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :block_class_subjects do |t|
      t.integer :block_class_id, null: false
      t.integer :subject_id, null: false
      
      t.timestamps
    end

    add_index :block_class_subjects, [:block_class_id, :subject_id]
  end
end
