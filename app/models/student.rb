class Student < User
  belongs_to :block_class
  has_many :exams
end
