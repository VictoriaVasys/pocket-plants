class Users::FavoriteFlowerPhotosController < Users::BaseController

  def index
    render json: current_user.favorite_flower_photos
  end

end