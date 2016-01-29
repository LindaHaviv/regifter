class User < ActiveRecord::Base
  has_many :gifts
  has_secure_password
  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email
end
