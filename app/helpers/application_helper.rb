module ApplicationHelper
  def human_time(argtime)
    diff = (Time.now - argtime).to_i.abs
    hours = diff / 3600
    minutes = diff / 60
    
    if diff < 20
      "a few seconds ago"
    elsif diff < 60 #less than a mintue
      "less than a minute ago"
    elsif diff < 120 #less than 2 minutes
      "about a minute ago"
    elsif diff < 3600 #less than an hour
      "#{minutes} minutes ago"
    elsif diff < 7200 #less than 2 hours
      "about an hour ago"
    elsif diff < 86400 #less than a day
      "#{hours} hours ago"
    else #anything more than a day
      argtime.localtime.strftime("%I:%M%p, %d %b, '%y")
    end
  end

  def absolute_local_time(argtime)
    argtime.localtime.strftime("%I:%M%p, %d %b, '%y")
  end
end
