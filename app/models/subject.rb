class Subject < ApplicationRecord
  has_and_belongs_to_many :block_classes
  belongs_to :teacher
  has_many :lectures
  has_many :assignments
  has_many :exam_schedules
end
