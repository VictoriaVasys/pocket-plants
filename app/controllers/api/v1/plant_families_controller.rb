class Api::V1::PlantFamiliesController < ApplicationController
  
  def index
    @plant_families = PlantFamily.all
  end
  
  def show
    @plant_family = PlantFamily.find(params[:id])
  end

end