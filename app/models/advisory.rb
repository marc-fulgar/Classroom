class Advisory < ApplicationRecord
  belongs_to :teacher
  has_one :block_class
  
  def block_class_name
    self.block_class.name
  end
end