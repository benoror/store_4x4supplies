class Supplier < ActiveRecord::Base
	has_many :products

    validates_presence_of :name

    validates_uniqueness_of :name, :case_sensitive => false

    def before_destroy
      unless products.count == 0
        false
      end
    end
end
