class Gift < ActiveRecord::Base
  belongs_to :user
  has_many :gift_categories, dependent: :destroy
  has_many :categories, through: :gift_categories

  accepts_nested_attributes_for :categories
end
