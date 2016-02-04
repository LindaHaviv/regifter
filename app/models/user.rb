class User < ActiveRecord::Base
  has_secure_password
  has_many :gifts
  has_many :requests, through: :gifts
  has_many :swaps
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :username, uniqueness: true, length: { minimum: 5 }
  validates :password, length: { minimum: 10 }
  validates_presence_of :name, :email, :username

  def self.authenticate!(username, password)
    user = find_by(username: username)
    user.authenticate(password) if user
  end

  def get_user_gifts
    @user_gifts = Gift.where(user_id: self.id)
    @gifts =  @user_gifts.select do |gift|
      if Swap.find_by(item_id: gift.id) == nil
        gift
      end
    end
    @gifts
  end

end
