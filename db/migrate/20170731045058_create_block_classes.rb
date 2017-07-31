class CreateBlockClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :block_classes do |t|
      t.string :name
      t.integer :advisory_id

      t.timestamps
    end
  end
end
