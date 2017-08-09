class AddMaxScoreToExam < ActiveRecord::Migration[5.1]
  def change
    add_column :exams, :max_score, :integer
  end
end
