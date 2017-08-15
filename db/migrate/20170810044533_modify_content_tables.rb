class ModifyContentTables < ActiveRecord::Migration[5.1]
  def up
    change_column :comments, :content, :text
    change_column :assignments, :content, :text
    change_column :lectures, :content, :text
    change_column :exam_schedules, :content, :text
    
    change_column :assignments, :remarks, :text
    change_column :lectures, :remarks, :text
    change_column :exam_schedules, :remarks, :text
    change_column :exams, :remarks, :text
  end
  
  def down
    change_column :comments, :content, :string
    change_column :assignments, :content, :string
    change_column :lectures, :content, :string
    change_column :exam_schedules, :content, :string
    
    change_column :assignments, :remarks, :string
    change_column :lectures, :remarks, :string
    change_column :exam_schedules, :remarks, :string
    change_column :exams, :remarks, :string
  end
end
