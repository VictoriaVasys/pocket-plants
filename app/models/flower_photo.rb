class FlowerPhoto < ApplicationRecord
  validates :assigned_name, presence: true, uniqueness: { scope: [:user_id] }
  validates :storage_url, presence: true, uniqueness: true
  
  belongs_to :plant_family
  belongs_to :user
  has_many :gvision_descriptions
  has_many :comments, as: :commentable
  has_many :favorites, as: :favorable
  
  def sanitized_name
    assigned_name.split(' ').join('%20')
  end
end
