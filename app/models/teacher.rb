class Teacher < User
  has_one :block_class
  has_many :subjects
end
