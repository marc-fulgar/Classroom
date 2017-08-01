class Subject < ApplicationRecord
  belongs_to :class_subject, optional: true

  before_create :create_class_subject
  before_destroy :destroy_class_subject
  
private
  def create_class_subject
    class_subject = ClassSubject.new(block_class_id: self.block_class_id, teacher_id: self.teacher_id).save!
  end

  def destroy_class_subject
    advisory = Advisory.find_by(teacher_id: self.id)
    advisory.destroy
  end
end
