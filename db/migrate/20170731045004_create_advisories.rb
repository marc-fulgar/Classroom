class CreateAdvisories < ActiveRecord::Migration[5.1]
  def change
    create_table :advisories do |t|
      t.integer :teacher_id
      t.integer :block_id

      t.timestamps
    end
  end
end
