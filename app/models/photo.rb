class Photo < ActiveRecord::Base
  has_many :likes
  belongs_to :user

  has_many :users_liked, through: :likes, source: :user

  validates :url, presence: true
end
