class PlantFamilyHabitat < ApplicationRecord
  belongs_to :habitat
  belongs_to :plant_family
end
