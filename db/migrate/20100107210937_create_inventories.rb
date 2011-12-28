class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.integer :product_id
      t.datetime :purchase_date

      t.timestamps
    end
  end

  def self.down
    drop_table :inventories
  end
end
