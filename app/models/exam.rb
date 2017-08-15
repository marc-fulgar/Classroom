class Exam < ApplicationRecord
  belongs_to :exam_schedule
  belongs_to :student
  
  def transmuted_score
    if self.grade?
      self.grade*100.0/self.max_score
    else
      0
    end
  end
end