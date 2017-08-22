class Course < ApplicationRecord
  has_many :students
  has_many :block_classes, through: :students
  
  validates :name, presence: true, uniqueness: true
end
