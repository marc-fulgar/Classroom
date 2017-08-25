class Assignment < ApplicationRecord
  belongs_to :subject
  has_many :comments, dependent: :delete_all
  acts_as_readable on: :updated_at
  
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :subject_id, presence: true
end
