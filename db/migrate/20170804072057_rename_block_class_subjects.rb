class RenameBlockClassSubjects < ActiveRecord::Migration[5.1]
  def change
    rename_table :block_class_subjects, :block_classes_subjects
  end
end
