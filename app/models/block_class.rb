class BlockClass < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_one :advisory
  has_one :teacher, through: :advisory
  has_many :students
  
  after_create :assign_advisory
  before_update :unassign_advisory
  after_update :assign_advisory
  after_destroy :unassign_advisory
  
private
  def assign_advisory
    if self.advisory_id
      advisory = Advisory.find(self.advisory_id)
      advisory.block_class_id = self.id
      advisory.save
    end
  end
  
  def unassign_advisory
    if self.advisory
      x = self.advisory
      x.block_class_id = nil
      x.save
    end
  end
end