class ClassSubject < ApplicationRecord
  has_many :subjects
  belongs_to :block_class, optional: true
  belongs_to :teacher, optional: true
end