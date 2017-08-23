class Lecture < ApplicationRecord
  belongs_to :subject
  has_many :comments, dependent: :delete_all
  acts_as_readable on: :updated_at
end
