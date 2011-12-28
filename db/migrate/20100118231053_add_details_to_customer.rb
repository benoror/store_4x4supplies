class AddDetailsToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :telephone, :string
    add_column :customers, :email, :string
    add_column :customers, :vehicle, :string
    add_column :customers, :club, :string
  end

  def self.down
    remove_column :customers, :club
    remove_column :customers, :vehicle
    remove_column :customers, :email
    remove_column :customers, :telephone
  end
end
