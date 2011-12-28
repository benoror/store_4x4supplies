class Bid < ActiveRecord::Base
  belongs_to :customer

  validates_presence_of :customer
  validates_presence_of :product
  validates_presence_of :vehicle

  validates_numericality_of :price, :allow_nil => true, :allow_blank => true
end
