class Api::V1::Users::GvisionDescriptionsController < Api::V1::Users::BaseController
  # skip_before_action :authorize_user, only: [:show, :index]
  
  # def index
  #   @gvision_descriptions = flower_photo.gvision_descriptions
  # end

  # def show
  #   begin
  #     @gvision_description = flower_photo.gvision_descriptions.find(params[:id])
  #   rescue
  #     render file: "public/404.html",  status: 404
  #   end
  # end
  
  def create
    @gvision_description = flower_photo.gvision_descriptions.new(gvision_description_params)
    if @gvision_description.save
      render :show, status: 201
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  # def update
  #   @gvision_description = flower_photo.gvision_descriptions.find(params[:id])
  #   @gvision_description.update(name: gvision_description_params[:name])
  #   if @gvision_description.save
  #     render :show, status: 200
  #   else
  #     render file: "public/422.html",  status: 422
  #   end
  # end
  
  def destroy
    @gvision_description = GvisionDescription.find(params[:id])
    if @gvision_description.destroy
      render json: {message: "Gvision Description successfully removed"}, status: 204
    else
      render file: "public/422.html",  status: 422
    end
  end
  
  private

  def gvision_description_params
    params.permit(:id, :name)
  end
  
  def flower_photo
    FlowerPhoto.find(params[:flower_photo_id])
  end
  
end