class Api::V1::FlowerPhotosController < ApplicationController
  def index
    @flower_photos = FlowerPhoto.all
  end

  def show
    begin
      @flower_photo = FlowerPhoto.find(params[:id])
    rescue
      render file: "public/404.html",  status: 404
    end
  end
end