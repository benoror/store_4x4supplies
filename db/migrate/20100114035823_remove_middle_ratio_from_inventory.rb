class RemoveMiddleRatioFromInventory < ActiveRecord::Migration
  def self.up
    remove_column :inventories, :middle_ratio
  end

  def self.down
    add_column :inventories, :middle_ratio, :decimal
  end
end
