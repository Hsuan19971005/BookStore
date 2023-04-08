class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :id_not_found

  helper_method :user_log_in?, :current_user

  private
  def user_log_in?
    session[:_user_].present?
  end
  
  def current_user
    return User.find_by(id: session[:_user_]) if user_log_in?
    return nil
  end

  def authenticate_user!
    if not user_log_in?
      redirect_to root_path, notice:"Please sign in"
    end
  end
  def id_not_found
    render file:Rails.root.join('public','404.html'), layout:false, status:404 and return
  end


end
