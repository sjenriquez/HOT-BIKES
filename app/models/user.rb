class User < ActiveRecord::Base
  has_secure_password

  has_many :photos
  has_many :likes

  has_many :liked_photos, through: :likes, source: :photo

  validates :name, presence: true
  validates :email, :uniqueness => true, :format => /.+@.+\..+/

end
