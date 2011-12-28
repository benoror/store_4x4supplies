class AddCurrencyRatioToInventory < ActiveRecord::Migration
  def self.up
    add_column :inventories, :currency_ratio, :decimal
  end

  def self.down
    remove_column :inventories, :currency_ratio
  end
end
