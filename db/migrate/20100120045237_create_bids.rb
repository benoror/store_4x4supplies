class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.string :product
      t.string :barcode
      t.string :vehicle
      t.text :description
      t.decimal :price
      t.boolean :notified
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
