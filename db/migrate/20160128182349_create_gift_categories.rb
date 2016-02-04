class CreateGiftCategories < ActiveRecord::Migration
  def change
    create_table :gift_categories do |t|
      t.references :gift, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
