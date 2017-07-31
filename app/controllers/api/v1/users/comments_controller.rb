class Api::V1::Users::CommentsController < Api::V1::Users::BaseController
  skip_before_action :authorize_user, only: [:show, :index]
  
  def index
    @comments = flower_photo.comments
  end

  def show
    begin
      @comment = flower_photo.comments.find(params[:id])
    rescue
      render file: "public/404.html",  status: 404
    end
  end
  
  def create
    @comment = flower_photo.comments.new(comment_params)
    @comment.user_id = flower_photo.user.id
    if @comment.save
      render :show, status: 201
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  def update
    @comment = flower_photo.comments.find(params[:id])
    @comment.update(body: comment_params[:body])
    if @comment.save
      render :show, status: 200
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: {message: "Comment successfully removed"}, status: 204
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  private

  def comment_params
    params.permit(:id, :body)
  end
  
  def flower_photo
    FlowerPhoto.find(params[:flower_photo_id])
  end
  
end