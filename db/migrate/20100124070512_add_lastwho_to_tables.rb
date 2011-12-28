class AddLastwhoToTables < ActiveRecord::Migration
  def self.up
    add_column :bids, :who_last, :string
    add_column :customers, :who_last, :string
    add_column :expenses, :who_last, :string
    add_column :inventories, :who_last, :string
    add_column :invoices, :who_last, :string
    add_column :products, :who_last, :string
    add_column :sales, :who_last, :string
  end

  def self.down
    remove_column :bid, :who_last
    remove_column :customers, :who_last
    remove_column :expenses, :who_last
    remove_column :inventories, :who_last
    remove_column :invoices, :who_last
    remove_column :products, :who_last
    remove_column :sales, :who_last
  end
end
