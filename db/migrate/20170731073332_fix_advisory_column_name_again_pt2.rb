class FixAdvisoryColumnNameAgainPt2 < ActiveRecord::Migration[5.1]
  def change
    rename_column :advisories, :user_id, :teacher_id
  end
end
