class AddBlockClassIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :block_class_id, :integer
  end
end
