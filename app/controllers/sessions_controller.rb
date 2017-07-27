class SessionsController < ApplicationController
  def create
    if params[:user] && params[:user][:password]
      regular_user
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You're all logged out. See you again soon :)"
    redirect_to root_path
  end

  private

  def regular_user
    if user = User.find_by(email: params[:user][:email])
      user_exists(user)
    else
      flash[:danger] = "Oops! Looks like that email's invalid. Please try again."
      redirect_to root_path
    end
  end

  def user_exists(user)
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = 'Welcome again, plant friend!'
      
      redirect_to users_favorite_flower_photos_path(current_user.username)
    else
      flash[:danger] = "We think you entered the wrong password. Try again please!"
      
      redirect_to root_path
    end
  end

end