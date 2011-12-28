class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :inventory_id
      t.datetime :sale_date
      t.decimal :sale_price

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
