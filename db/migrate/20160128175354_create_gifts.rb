class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title
      t.integer :value
      t.text :description
      t.string :brand
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
