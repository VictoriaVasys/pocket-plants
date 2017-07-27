class Users::BaseController < ApplicationController
  before_action :authorize_user

private

  def authorize_user
    render :file => "public/404.html", :status => 404 unless authorized?
  end

  def authorized?
    # return true if current_admin?
    # return true if current_favorites
    return true if personal_asset?

    return false
  end
  
  def personal_asset?
    current_user.username == params[:username]
  end
  
end