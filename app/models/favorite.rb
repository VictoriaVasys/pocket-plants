class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorable, polymorphic: true
  # belongs_to :flower_photo
end
