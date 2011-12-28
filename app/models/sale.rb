class Sale < ActiveRecord::Base
	belongs_to :inventory
	belongs_to :invoice

    validates_presence_of :inventory
    #validates_presence_of :invoice_id
    validates_presence_of :sale_date
    validates_presence_of :sale_price

    validates_numericality_of :sale_price
end
