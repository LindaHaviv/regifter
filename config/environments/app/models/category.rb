class Category < ActiveRecord::Base
  has_many :gift_categories
  has_many :gifts, through: :gift_categories
end
