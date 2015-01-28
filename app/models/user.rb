class User < ActiveRecord::Base
  has_secure_password

  has_many :photos
  has_many :likes

  validates :name, presence: true
  validates :email, :uniqueness => true, :format => /.+@.+\..+/

end
