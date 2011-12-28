class Expense < ActiveRecord::Base

    validates_presence_of :name
    validates_presence_of :date
    validates_presence_of :amount

    validates_numericality_of :amount
end
