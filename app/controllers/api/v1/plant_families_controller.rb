class Api::V1::PlantFamiliesController < ApplicationController
  def index
    @plant_families = PlantFamily.all
  end

  def show
    begin
      @plant_family = PlantFamily.find(params[:id])
    rescue
      render file: "public/404.html",  status: 404
    end
  end
end