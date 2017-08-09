class ExamSchedule < ApplicationRecord
  belongs_to :subject
  has_many :exams, dependent: :delete_all
  
  after_create :build_exams
  
private
  def build_exams
    self.subject.block_classes.each do |block_class|
      block_class.students.each do |student|
        self.exams.create(student_id: student.id, max_score: self.max_score)
      end
    end
  end
end
