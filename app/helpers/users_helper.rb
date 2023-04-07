module UsersHelper
  def user_sign_in?
    session[:_user_].present?
  end
  
  def current_user
    return User.find_by(id: session[:_user_]) if user_sign_in?
    return nil
  end
end
