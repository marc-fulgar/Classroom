class FixAdvisoryColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :advisories, :block_id, :block_class_id
  end
end
