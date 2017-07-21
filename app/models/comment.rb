class Comment < ApplicationRecord
  validates :body, presence: true
  
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :favorites, as: :favorable
end
