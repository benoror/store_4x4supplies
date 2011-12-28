class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.datetime :date
      t.string :name
      t.decimal :charge
      t.decimal :payment

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
