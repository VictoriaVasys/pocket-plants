class GvisionDescription < ApplicationRecord
  validates :name, presence: true
  
  belongs_to :flower_photo
  has_many :favorites, as: :favorable
end
