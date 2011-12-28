class Transaction < ActiveRecord::Base
    validates_presence_of :date
    validates_presence_of :name

#validates_numericality_of :charge
#    validates_numericality_of :payment

    validate :charge_xor_payment

  private

    def charge_xor_payment
      if !(charge.blank? ^ payment.blank?)
        errors.add_to_base("Especifica un cargo o un abono.")
      end
    end

end
