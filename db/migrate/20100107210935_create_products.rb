class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :barcode
      t.decimal :cost
      t.decimal :top_price
      t.decimal :middle_price
      t.decimal :bottom_price
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
