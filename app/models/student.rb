class Student < User
  belongs_to :block_class
  has_many :exams
  
  def average_score
    sum = 0
    self.exams.each do |exam|
      sum += exam.transmuted_score
    end
    sum / self.exams.count
  end
end
