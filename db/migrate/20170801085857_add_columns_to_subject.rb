class AddColumnsToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :teacher_id, :integer
    add_column :subjects, :block_class_id, :integer
  end
end
