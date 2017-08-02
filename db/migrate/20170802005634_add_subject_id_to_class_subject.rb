class AddSubjectIdToClassSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :class_subjects, :subject_id, :integer
  end
end
