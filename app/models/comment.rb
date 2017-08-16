class Comment < ApplicationRecord
  belongs_to :lecture, optional: true
  belongs_to :assignment, optional: true
  belongs_to :exam_schedule, optional: true
  belongs_to :user
  
  def human_time
    diff = (Time.now - created_at.localtime).to_i.abs
    hours = diff / 3600
    minutes = diff / 60
    
    if diff < 20
      "A few seconds ago"
    elsif diff < 60
      "Less than a minute ago"
    elsif diff < 120
      "About a minute ago"
    elsif diff < 3600
      "#{minutes} minutes ago"
    elsif diff < 86400
      "#{hours} hours ago"
    else
      created_at.localtime.strftime("%I:%M%p, %d %b, '%y")
    end
  end
end