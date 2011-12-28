class Settings < ActiveRecord::Base

  attr_accessor :purchase_date
  attr_accessor :currency_ratio
  attr_accessor :tax_ratio
  attr_accessor :import_ratio
  attr_accessor :top_ratio
  attr_accessor :bottom_ratio

  validates_presence_of :purchase_date
  validates_presence_of :currency_ratio
  validates_presence_of :tax_ratio
  validates_presence_of :import_ratio
  validates_presence_of :top_ratio
  validates_presence_of :bottom_ratio

  validates_numericality_of :currency_ratio
  validates_numericality_of :tax_ratio
  validates_numericality_of :import_ratio
  validates_numericality_of :top_ratio
  validates_numericality_of :bottom_ratio
end
