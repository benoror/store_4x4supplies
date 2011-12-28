class Customer < ActiveRecord::Base
	has_many :invoices
    has_many :bids, :dependent => :destroy

    validates_presence_of :fullname

    validates_uniqueness_of :ssn, :case_sensitive => false, :allow_nil => true, :allow_blank => true
    validates_uniqueness_of :email, :case_sensitive => false, :allow_nil => true, :allow_blank => true

    def before_destroy
      unless invoices.count == 0
        false
      end
    end

#in controller DESTROY
#if not @customer.destroy
#flash[:notice] = 'No se puede borrar cliente ya que existe en factura'
#end
end
