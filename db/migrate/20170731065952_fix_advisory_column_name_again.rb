class FixAdvisoryColumnNameAgain < ActiveRecord::Migration[5.1]
  def change
    rename_column :advisories, :teacher_id, :user_id
  end
end
