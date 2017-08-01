class Teacher < User
  has_one :advisory
  has_one :block, through: :advisory
  
  after_create :create_advisory
  
  def block_class_name
    self.advisory.block_class_id ? self.advisory.block_class.name : nil
  end
  
  def block_class
    self.advisory.block_class_id ? self.advisroy.block_class : nil
  end

private
  def create_advisory
    Advisory.create teacher_id: self.id, teacher_name: (self.last_name + ", " + self.first_name)
  end
end
