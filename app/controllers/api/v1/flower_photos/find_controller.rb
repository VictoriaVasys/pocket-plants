class Api::V1::FlowerPhotos::FindController < ApplicationController

  def show
    find_params(flower_photo_params.keys.first)
  end

  private
  def find_params(attribute)
    begin
      @flower_photo = FlowerPhoto.find_by("#{attribute}": params[:"#{attribute}"])
    rescue
      render file: "public/404.html",  status: 404
    end
  end

  def flower_photo_params
    params.permit(:id, :assigned_name)
  end
end
