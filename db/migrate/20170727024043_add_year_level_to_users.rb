class AddYearLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :year_level, :integer
    add_column :users, :course_id, :integer
  end
end
