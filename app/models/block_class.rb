class BlockClass < ApplicationRecord
  has_and_belongs_to_many :subjects
  belongs_to :teacher
  has_many :students
  
  validates :name, :teacher_id, presence: true, uniqueness: true
end