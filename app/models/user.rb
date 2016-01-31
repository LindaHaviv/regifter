class User < ActiveRecord::Base
  has_secure_password
  has_many :gifts
  validates_uniqueness_of  :name, :email
  validates_presence_of  :name, :email

end
