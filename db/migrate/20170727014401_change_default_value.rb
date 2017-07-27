class ChangeDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :is_admin, from: true, to: false
  end
end
