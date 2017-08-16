class Assignment < ApplicationRecord
  belongs_to :subject
  has_many :comments, dependent: :delete_all
end
