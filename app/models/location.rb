class Location < ApplicationRecord
  validates :city, presence: true
  validates :country, presence: true
  
  has_many :flower_photos
end
