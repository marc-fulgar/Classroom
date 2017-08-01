class Teacher < User
  has_one :advisory
  has_one :block, through: :advisory
  
  def block_class_name
    self.advisory.block_class ? self.advisory.block_class.name : nil
  end
  
  def block_class
    self.advisory.block_class ? self.advisroy.block_class : nil
  end
end
