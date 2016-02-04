class CreateSwapsTable < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.integer :item_id, foreign_key: true
      t.integer :swapped_item_id, foreign_key: true
      t.integer :new_owner_id, foreign_key: true
      t.integer :old_owner_id, foreign_key: true
      t.timestamps null: false
    end
  end
end
