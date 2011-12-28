class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :supplier
	has_many :inventories

    validates_presence_of :name
    validates_presence_of :cost
    validates_presence_of :barcode
    validates_presence_of :category
    validates_presence_of :supplier

    validates_uniqueness_of :name, :case_sensitive => false
    validates_uniqueness_of :barcode, :case_sensitive => false

    validates_numericality_of :cost

    def before_destroy
      unless inventories.count == 0
        false
      end
    end
end
