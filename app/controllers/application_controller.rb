class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :authenticate_user

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user?
    !current_user.nil?
  end
  
  def authenticate_user
    render :file => "public/404.html", :status => 404 unless current_user?
  end
  
end
