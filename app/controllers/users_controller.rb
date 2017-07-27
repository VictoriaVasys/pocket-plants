class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Wooohoo, you're an official pocket-planter! :D"
      session[:user_id] = @user.id
      redirect_to users_favorite_flower_photos_path(@user.username)
    else
      flash[:danger] = "Couldn't create account; #{@user.errors.full_messages.join(", ")}"
      redirect_to sign_up_path
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
  
end