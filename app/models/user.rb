class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  has_many :flower_photos
  has_many :favorites
  has_many :favorite_flower_photos, through: :favorites, source: :favorable, source_type: 'FlowerPhoto'
  has_many :comments, as: :commentable
end
