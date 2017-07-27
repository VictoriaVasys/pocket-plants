class Users::FavoriteFlowerPhotosController < Users::BaseController

  def index
    @favorite_flower_photos = current_user.favorite_flower_photos
  end

end