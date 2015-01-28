class Photo < ActiveRecord::Base
  has_many :likes
  belongs_to :user

  validates :url, presence: true
end
