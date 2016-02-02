class Gift < ActiveRecord::Base
  belongs_to :user
  # has_many :requests

  # has_many :requests, foreign_key: :wanted_id

  # accepts_nested_attributes_for :requests
  has_many :gift_categories, dependent: :destroy
  has_many :categories, through: :gift_categories, dependent: :destroy
  accepts_nested_attributes_for :categories
  validates_presence_of :title, :value, :description, :brand, :image
  # searchkick autocomplete: ['title', 'brand']
  mount_uploader :image, AssetUploader

  def requests_wanted
    Request.where(wanted_id: self.id)
  end

  def requests_made
    Request.where(unwanted_id: self.id)
  end

end
