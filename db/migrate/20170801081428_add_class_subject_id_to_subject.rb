class AddClassSubjectIdToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :class_subject_id, :integer
  end
end
