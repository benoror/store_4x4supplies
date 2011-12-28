class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :fullname
      t.string :ssn
      t.string :address1
      t.string :address2

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
