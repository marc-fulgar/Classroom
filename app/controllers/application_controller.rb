class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from SecurityError do |exception|
    redirect_to root_path
  end
  
  # restrict access to admin module for non-admin users
  def authenticate_admin!
    raise SecurityError unless current_user.try(:is_admin?)
  end

  def after_sign_in_path_for(user)
    user.is_admin ? root_path : root_path 
  end
end
