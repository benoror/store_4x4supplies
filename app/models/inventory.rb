class Inventory < ActiveRecord::Base
	belongs_to :product
	has_one :sale

    attr_accessor :quantity

    validates_presence_of :product
    validates_presence_of :purchase_date
    validates_presence_of :cost
    validates_presence_of :tax_ratio
    validates_presence_of :import_ratio
    validates_presence_of :currency_ratio
    validates_presence_of :top_ratio
    validates_presence_of :bottom_ratio
    validates_presence_of :quantity

    validates_numericality_of :top_ratio
    validates_numericality_of :bottom_ratio

    def before_destroy
      if sale
        false
      end
    end
end
