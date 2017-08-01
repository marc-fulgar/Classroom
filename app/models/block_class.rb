class BlockClass < ApplicationRecord
  has_one :advisory
  has_one :teacher, through: :advisory
  has_many :students
  
  def teacher_first_name
    self.advisory.teacher ? self.advisory.teacher_first_name : nil
  end
  
  def teacher_last_name
    self.advisory.teacher ? self.advisory.teacher_last_name : nil
  end
end