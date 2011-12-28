class AddImportRatioToInventory < ActiveRecord::Migration
  def self.up
    add_column :inventories, :import_ratio, :decimal, :default => 0.15
  end

  def self.down
    remove_column :inventories, :import_ratio
  end
end
