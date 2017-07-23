class PlantFamily < ApplicationRecord
  validates :common_name, presence: true
  validates :taxonomic_name, presence: true, uniqueness: true
  validates :sample_photo_storage_url, presence: true
  
  has_many :flower_photos
  has_many :plant_family_habitats
  has_many :habitats, through: :plant_family_habitats
end
