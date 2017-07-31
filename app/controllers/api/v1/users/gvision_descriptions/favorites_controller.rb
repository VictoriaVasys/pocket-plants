class Api::V1::Users::GvisionDescriptions::FavoritesController < Api::V1::Users::BaseController
  skip_before_action :authorize_user
  before_action :authenticate_user
  
  def create
    @favorite = gvision_description.favorites.new(user_id: gvision_description.flower_photo.user.id)
    if @favorite.save
      render json: {
        message: "Favorite successfully added",
        favorites_count: gvision_description.favorites.count
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
        favorites_count: gvision_description.favorites.count
      }, status: 202
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  private
  
  def gvision_description
    GvisionDescription.find(params[:gvision_description_id])
  end
  
end