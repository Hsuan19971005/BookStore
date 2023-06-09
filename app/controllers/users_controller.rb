class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:_user_] = @user.id
      redirect_to root_path, notice: "Sign Up Success!"
    else
      render :new
    end
  end
  
  def sign_in
    @user = User.new
  end





  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
