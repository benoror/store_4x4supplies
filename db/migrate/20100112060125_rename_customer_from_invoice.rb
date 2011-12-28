class RenameCustomerFromInvoice < ActiveRecord::Migration
  def self.up
    remove_column :invoices, :cutomer_id, :integer
    add_column :invoices, :customer_id, :integer
  end

  def self.down
    remove_column :invoices, :customer_id, :integer
    add_column :invoices, :cutomer_id, :integer
  end
end
