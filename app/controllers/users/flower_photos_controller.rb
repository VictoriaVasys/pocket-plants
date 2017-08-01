class Users::FlowerPhotosController < Users::BaseController
  skip_before_action :authorize_user, only: [:show]
  
  def show
    @flower_photo = user.flower_photos.find_by(assigned_name: params[:flower_photo_name])
  end
  
  private
  
  def user
    User.find_by(username: params[:username])
  end

end