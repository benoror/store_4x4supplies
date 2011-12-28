class Invoice < ActiveRecord::Base
	belongs_to :customer
	has_many :sales

    validates_presence_of :customer

    def before_destroy
      unless sales.count == 0
        false
      end
    end

#in controller DESTROY
#if not @invoice.destroy
#flash[:notice] = 'No se puede borrar factura ya que existe en venta'
#end
end
