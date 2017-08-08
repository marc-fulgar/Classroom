class Assignment < ApplicationRecord
  belongs_to :subject
  has_many :comments
end
