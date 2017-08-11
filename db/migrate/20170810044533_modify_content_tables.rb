class ModifyContentTables < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :content, :text
    change_column :assignments, :content, :text
    change_column :lectures, :content, :text
    change_column :exam_schedules, :content, :text
    
    change_column :assignments, :remarks, :text
    change_column :lectures, :remarks, :text
    change_column :exam_schedules, :remarks, :text
    change_column :exams, :remarks, :text
  end
end
