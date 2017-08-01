class ClassSubject < ApplicationRecord
  has_one :subject
  belongs_to :block_class
  belongs_to :teacher
end
