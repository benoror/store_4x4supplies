class AddValuesToInventory < ActiveRecord::Migration
  def self.up
    add_column :inventories, :cost, :decimal
    add_column :inventories, :tax_ratio, :decimal, :default => 0.0825
  end

  def self.down
    remove_column :inventories, :tax_ratio
    remove_column :inventories, :cost
  end
end
