class User < ActiveRecord::Base
  has_secure_password
  has_many :gifts
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :username, uniqueness: true, length: { minimum: 5 }
  validates :password, length: { minimum: 7 }
  validates_presence_of  :name, :email, :username

  def self.authenticate!(username, password)
      user = self.find_by(username: username)
      user.authenticate(password) if user
    end
end
