class User < ActiveRecord::Base
  has_secure_password
  has_many :gifts
  validates_uniqueness_of  :name, :email
  validates_presence_of  :name, :email
  
  def self.authenticate!(email, password)
      user = self.find_by(email: email)
      user.authenticate(password) if user
    end
end
