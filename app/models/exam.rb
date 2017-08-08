class Exam < ApplicationRecord
  belongs_to :exam_schedule
  belongs_to :student
end
