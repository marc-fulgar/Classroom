class RemoveTeacherIdFromClassSubject < ActiveRecord::Migration[5.1]
  def change
    remove_column :class_subjects, :teacher_id
  end
end
