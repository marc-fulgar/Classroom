class Comment < ApplicationRecord
  belongs_to :lecture, optional: true
  belongs_to :assignment, optional: true
  belongs_to :exam_schedule, optional: true
  belongs_to :user
  has_paper_trail
  
  def parent
    if self.try(:assignment_id)
      parent = self.assignment
    elsif self.try(:lecture_id)
      parent = self.lecture
    elsif self.try(:exam_schedule_id)
      parent = self.exam_schedule
    else
      parent = self
    end
  end
  
  def icon_url
    self.user.avatar.url(:icon)
  end
end