class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :content
      t.string :remarks
      t.integer :subject_id

      t.timestamps
    end
  end
end
