class Gift < ActiveRecord::Base
  belongs_to :user
  has_many :gift_categories, dependent: :destroy
  has_many :categories, through: :gift_categories, dependent: :destroy
  accepts_nested_attributes_for :categories
  validates_presence_of :title, :value, :description, :brand, :image
  mount_uploader :image, AssetUploader
  include PgSearch
  pg_search_scope :search, against: [:title, :description, :brand]
end
