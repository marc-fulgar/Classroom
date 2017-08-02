class BlockClass < ApplicationRecord
  belongs_to :advisory
  has_one :teacher, through: :advisory
  has_many :students
  has_many :class_subjects
  has_many :subjects, through: :class_subject
  
  def teacher_first_name
    self.advisory.teacher_id ? self.advisory.teacher.first_name : nil
  end
  
  def teacher_last_name
    self.advisory.teacher_id ? self.advisory.teacher.last_name : nil
  end
end