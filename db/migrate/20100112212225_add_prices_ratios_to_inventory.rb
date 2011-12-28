class AddPricesRatiosToInventory < ActiveRecord::Migration
  def self.up
    add_column :inventories, :top_ratio, :decimal
    add_column :inventories, :middle_ratio, :decimal
    add_column :inventories, :bottom_ratio, :decimal

    remove_column :products, :bottom_price
    remove_column :products, :middle_price
    remove_column :products, :top_price
  end

  def self.down
    remove_column :inventories, :bottom_ratio
    remove_column :inventories, :middle_ratio
    remove_column :inventories, :top_ratio

    add_column :products, :top_price, :decimal
    add_column :products, :middle_price, :decimal
    add_column :products, :bottom_price, :decimal
  end
end
