class AddInvoiceToSale < ActiveRecord::Migration
  def self.up
    add_column :sales, :invoice_id, :integer
  end

  def self.down
    remove_column :sales, :invoice_id
  end
end
