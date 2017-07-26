class Api::V1::PlantFamilies::FindController < ApplicationController

  def show
    find_params(plant_family_params.keys.first)
  end

  private
  def find_params(attribute)
    @plant_family = PlantFamily.find_by("#{attribute}": params[:"#{attribute}"])
  end

  def plant_family_params
    params.permit(:id, :common_name, :taxonomic_name)
  end
end
