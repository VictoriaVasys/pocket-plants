class PlantFamily < ApplicationRecord
  validates :common_name, presence: true
  validates :taxonomic_name, presence: true, uniqueness: true
  
  has_many :flower_photos
  
  def sanitized_common_name
    common_name.split(' ').join('%20')
  end
  
  def sanitized_taxonomic_name
    taxonomic_name.split(' ').join('%20')
  end
end
