class FlowerPhoto < ApplicationRecord
  validates :assigned_name, presence: true
  validates :storage_url, presence: true, uniqueness: true
  
  belongs_to :plant_family
  belongs_to :user
  belongs_to :habitat
  belongs_to :location
  has_many :gvision_descriptions
  has_many :comments, as: :commentable
  has_many :favorites, as: :favorable
end
