class Gift < ActiveRecord::Base
  belongs_to :user
  has_many :gift_categories, dependent: :destroy
  has_many :categories, through: :gift_categories, dependent: :destroy
  accepts_nested_attributes_for :categories
  validates_presence_of :title, :value, :description, :brand, :image
  searchkick autocomplete: ['title', 'brand']
  mount_uploader :image, AssetUploader
end
