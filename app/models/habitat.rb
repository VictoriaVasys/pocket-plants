class Habitat < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :flower_photos
  has_many :plant_family_habitats
  has_many :plant_families, through: :plant_family_habitats
end
