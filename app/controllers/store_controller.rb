class StoreController < ApplicationController
  def index
    @sql = "SELECT i.*, p.category_id, COUNT(i.product_id) AS count,
                    i.cost*(1+i.tax_ratio)*(1+i.import_ratio)*(1+i.top_ratio) AS top_price
            FROM inventories i
            JOIN products p ON (p.id = i.product_id)
            JOIN categories c ON (p.category_id = c.id)
            WHERE i.id NOT IN (SELECT inventory_id FROM sales) "

    if params[:cat]
      @sql += "AND category_id = #{params[:cat]} "
    end
            
    @inventories = Inventory.paginate_by_sql @sql+"GROUP BY i.product_id, i.purchase_date, i.cost, 
                                                        i.tax_ratio, i.import_ratio, i.currency_ratio
                                                   ORDER BY p.image, i.updated_at DESC ",
                                                        :page => params[:page], :per_page => 3
  end

  def show
  end

end
