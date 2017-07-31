class Api::V1::Users::Comments::FavoritesController < Api::V1::Users::BaseController
  skip_before_action :authorize_user
  before_action :authenticate_user
  
  def create
    @favorite = comment.favorites.new(user_id: comment.user.id)
    if @favorite.save
      render json: {
        message: "Favorite successfully added",
        favorites_count: comment.favorites.count
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
        favorites_count: comment.favorites.count
      }, status: 202
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  private
  
  def comment
    Comment.find(params[:comment_id])
  end
  
end