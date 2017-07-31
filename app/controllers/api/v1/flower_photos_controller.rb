class Api::V1::FlowerPhotosController < ApplicationController
  
  def index
    @flower_photos = FlowerPhoto.all
  end

end