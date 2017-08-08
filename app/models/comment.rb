class Comment < ApplicationRecord
  belongs_to :lecture, optional: true
  belongs_to :assignment, optional: true
  belongs_to :user
end
