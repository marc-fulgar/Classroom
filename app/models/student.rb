class Student < User
  belongs_to :block_class
  has_many :exams
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, on: :update, uniqueness: true, length: {minimum: 4, maximum: 50}
  validates :first_name, :last_name, on: :update, allow_blank: true, presence: true
  validates :block_class_id, :course, presence: true
  validates :password, on: :create, presence: true
  validates :password, on: :update, allow_blank: true, presence: true
  validates_confirmation_of :password
  
  def average_score
    sum = 0
    self.exams.each do |exam|
      sum += exam.transmuted_score
    end
    if self.exams.count > 0
      sum / self.exams.count
    else
      0
    end
  end
  
  def subject_average(subject)
    sum = 0.0
    count = 0
    subject.exam_schedules.each do |exam_schedule|
      exam_schedule.exams.where(student: self).each do |exam|
        count += 1
        if exam.grade
          sum += exam.grade
        else
          return nil
        end
      end
    end
    sum / count
  end
end