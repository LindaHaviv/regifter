class Gift < ActiveRecord::Base
  belongs_to :user
  has_many :items, class_name: "Swap", foreign_key: :item_id
  has_many :swapped_items, class_name: "Swap", foreign_key: :swapped_item_id
  has_many :requests, foreign_key: :wanted_id, dependent: :destroy
  accepts_nested_attributes_for :requests
  has_many :gift_categories, dependent: :destroy
  has_many :categories, through: :gift_categories
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :requests
  validates_presence_of :title, :value, :description, :brand, :image
  mount_uploader :image, AssetUploader
  include PgSearch
  pg_search_scope :search, against: [:title, :description, :brand]

  

  def requests_wanted
    Request.where(wanted_id: id)
  end

  def requests_made
    Request.where(unwanted_id: id)
  end

  def self.get_all_gifts
    self.joins("LEFT OUTER JOIN swaps ON gifts.id = swaps.item_id")
        .where(swaps: {item_id: nil})
  end

end
