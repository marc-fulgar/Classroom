class Subject < ApplicationRecord
  has_and_belongs_to_many :block_classes
  belongs_to :teacher
end
