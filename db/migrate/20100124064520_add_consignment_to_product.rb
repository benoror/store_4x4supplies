class AddConsignmentToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :consignment, :boolean
  end

  def self.down
    remove_column :products, :consignment
  end
end
