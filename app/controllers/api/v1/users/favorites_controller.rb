class Api::V1::Users::FavoritesController < Api::V1::Users::BaseController
  skip_before_action :authorize_user
  before_action :authenticate_user
  
  def index
    @favorite_flower_photos = current_user.favorite_flower_photos
  end
  
  def create
    @favorite = flower_photo.favorites.new(user_id: flower_photo.user.id)
    if @favorite.save
      render json: {
        message: "Favorite successfully added",
        favorites_count: flower_photo.favorites.count
      }, status: 201
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      render json: {
        message: "Favorite successfully removed",
        favorites_count: flower_photo.favorites.count
      }, status: 202
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  private
  
  def flower_photo
    FlowerPhoto.find(params[:flower_photo_id])
  end
  
end