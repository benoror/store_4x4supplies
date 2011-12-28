class AddImageToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :image, :string, :default => 'nopic.png'
  end

  def self.down
    remove_column :products, :image
  end
end
