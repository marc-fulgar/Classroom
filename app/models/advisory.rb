class Advisory < ApplicationRecord
  belongs_to :teacher
  belongs_to :block_class, optional: true
  
  def block_class_name
    self.block_class.name
  end
end