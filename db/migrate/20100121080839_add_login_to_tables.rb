class AddLoginToTables < ActiveRecord::Migration
  def self.up
    add_column :bids, :who, :string
    add_column :customers, :who, :string
    add_column :expenses, :who, :string
    add_column :inventories, :who, :string
    add_column :invoices, :who, :string
    add_column :products, :who, :string
    add_column :sales, :who, :string
  end

  def self.down
    remove_column :bid, :who
    remove_column :customers, :who
    remove_column :expenses, :who
    remove_column :inventories, :who
    remove_column :invoices, :who
    remove_column :products, :who
    remove_column :sales, :who
  end
end
