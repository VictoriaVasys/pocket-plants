class Api::V1::FlowerPhotos::FindController < ApplicationController

  def index
    find_by_plant_family(flower_photo_params.keys.first)
  end

  private
  def find_by_plant_family(plant_family_attribute)
    begin
      if plant_family_attribute == "taxonomic_family_name"
        @flower_photos = FlowerPhoto.joins(:plant_family).where(plant_families: {taxonomic_name: params[:"#{plant_family_attribute}"]})
      elsif plant_family_attribute == "common_family_name"
        @flower_photos = FlowerPhoto.joins(:plant_family).where(plant_families: {common_name: params[:"#{plant_family_attribute}"]})
      end
    rescue
      render file: "public/404.html",  status: 404
    end
  end

  def flower_photo_params
    params.permit(:id, :common_family_name, :taxonomic_family_name)
  end
end
