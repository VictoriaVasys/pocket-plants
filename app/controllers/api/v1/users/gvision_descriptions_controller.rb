class Api::V1::Users::GvisionDescriptionsController < Api::V1::Users::BaseController
  
  def create
    @gvision_description = flower_photo.gvision_descriptions.new(gvision_description_params)
    if @gvision_description.save
      render :show, status: 201
    else
      render file: "public/422.html",  status: 422
    end
  end
  
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