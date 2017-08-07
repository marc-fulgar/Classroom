class AddTeacherIdToBlockClass < ActiveRecord::Migration[5.1]
  def change
    add_column :block_classes, :teacher_id, :integer
  end
end
