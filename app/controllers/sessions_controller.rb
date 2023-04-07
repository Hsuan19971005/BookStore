class SessionsController < ApplicationController
  def create
    user = User.login(email: params[:user][:email], password: params[:user][:password] )
    if user
      session[:_user_] = user.id
      redirect_to root_path, notice: "Login Succussfully!"
    else
      redirect_to sign_in_users_path, alert: "Login Failure!"
    end
  end

  def destroy
    session[:_user_] = nil
    redirect_to root_path, notice: "Logout Successfully!"
  end
end
