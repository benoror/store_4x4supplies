class AddWhosToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :who, :string
  end

  def self.down
    remove_column :transactions, :who
  end
end
