class AddCostToBid < ActiveRecord::Migration
  def self.up
    add_column :bids, :cost, :decimal
  end

  def self.down
    remove_column :bids, :cost
  end
end
