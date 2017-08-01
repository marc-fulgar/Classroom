class AddBlockClassIdToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :block_class_id, :integer
  end
end
