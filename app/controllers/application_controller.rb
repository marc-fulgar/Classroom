class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You do not have permission to access this page!"
    redirect_to root_url
  end
  
  rescue_from SecurityError do |exception|
    redirect_to root_path
  end
  
  # restrict access to admin module for non-admin users
  def authenticate_admin!
    raise SecurityError unless current_user.try(:is_admin?)
  end

  def after_sign_in_path_for(user)
    if user.is_admin
      dashboard_path
    elsif user.type? 'Student'
      block_class_path(user.block_class)
    elsif user.type? 'Teacher'
      teacher_path(user)
    end
  end
end
