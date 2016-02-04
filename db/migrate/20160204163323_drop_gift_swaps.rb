class DropGiftSwaps < ActiveRecord::Migration
  def change
    drop_table :gift_swaps
  end
end
