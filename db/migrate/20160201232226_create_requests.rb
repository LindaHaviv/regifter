class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :wanted_id, foreign_key: true
      t.integer :unwanted_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
