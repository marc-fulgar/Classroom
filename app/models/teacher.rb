class Teacher < User
  has_one :advisory, dependent: :destroy
  has_one :block_class, through: :advisory
  has_many :subjects
  
  after_create :create_advisory
  
private
  def create_advisory
    advisory = Advisory.new( teacher_id: self.id, teacher_name: (self.last_name + ", " + self.first_name) )
    advisory.save
    self.advisory_id = advisory.id
  end
end
