class CreateGiftSwaps < ActiveRecord::Migration
  def change
    create_table :gift_swaps do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :proposed_gift_id
      t.integer :asked_gift_id
      t.boolean :accepted, default: false
     

      t.timestamps null: false
    end
    add_index :gift_swaps, :sender_id
    add_index :gift_swaps, :receiver_id
  end
end
