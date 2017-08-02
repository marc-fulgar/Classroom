class Subject < ApplicationRecord
  belongs_to :class_subject, optional: true
  has_many :block_classes, through: :class_subject

  after_create :create_class_subject
  after_create :destroy_orphan_class_subjects
  before_destroy :destroy_class_subject
  
private
  def create_class_subject
    if block_class_ids.present?
      block_class_ids.each do
        class_subject = ClassSubject.new(teacher_id: self.teacher_id, subject_id: self.id).save!
      end
    else
      class_subject = ClassSubject.new(teacher_id: self.teacher_id, subject_id: self.id).save!
    end
  end

  def destroy_class_subject
    ClassSubject.where(subject_id: self.id).destroy_all
  end
  
  def destroy_orphan_class_subjects
    ClassSubject.where(subject_id: nil).destroy_all
  end
end
