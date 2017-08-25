class Subject < ApplicationRecord
  has_and_belongs_to_many :block_classes
  belongs_to :teacher
  has_many :lectures
  has_many :assignments
  has_many :exam_schedules
  
  validates :name, presence: true, uniqueness: true
  validates :teacher_id, :block_class_ids, presence: true
end
