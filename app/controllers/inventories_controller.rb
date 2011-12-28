class InventoriesController < ApplicationController
  before_filter :login_required

  def index
    @sql = "SELECT i.*, COUNT(i.id) AS count,
              i.cost*(1+i.tax_ratio)*(1+i.import_ratio) AS total,
              i.cost*(1+i.tax_ratio)*(1+i.import_ratio)*(1+i.top_ratio) AS top_price,
              i.cost*(1+i.tax_ratio)*(1+i.import_ratio)*(1+i.bottom_ratio) AS bottom_price
            FROM inventories i
            JOIN products p ON (i.product_id = p.id)
            WHERE 1=1 "
           
    params[:page] = '1' unless params[:page]

    if params[:search]
      @sql += "AND (p.barcode LIKE '%#{params[:search]}%' OR p.name LIKE '%#{params[:search]}%') "
    end

    @sql += "GROUP BY i.product_id, i.cost, i.tax_ratio, i.import_ratio, i.currency_ratio
             ORDER BY i.created_at DESC"

    @inventories = Inventory.paginate_by_sql @sql, :page => params[:page], :per_page => 5

  end

  def new
    @inventory = Inventory.new
    @inventory.product = Product.find(params[:id])

    @inventory.purchase_date = Settings.purchase_date #Time.local(2010,"jan",5) #***DEFAULT CONFIGURATION VALUE
    @inventory.tax_ratio = Settings.tax_ratio #0.0825 #***DEFAULT CONFIGURATION VALUE
    @inventory.import_ratio = Settings.import_ratio #0.1326 #***DEFAULT CONFIGURATION VALUE
    @inventory.currency_ratio = Settings.currency_ratio #13.15 #***DEFAULT CONFIGURATION VALUE
    @inventory.top_ratio = Settings.top_ratio #0.70 #***DEFAULT CONFIGURATION VALUE
    @inventory.bottom_ratio = Settings.bottom_ratio #0.60 #***DEFAULT CONFIGURATION VALUE
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = Inventory.new(params[:inventory])
    @inventory.who = current_user.login
    @inventory.who_last = current_user.login

    if @inventory.save

      (params[:inventory][:quantity].to_i-1).times do
        Inventory.create(params[:inventory])
      end

      flash[:notice] = 'Inventory was successfully created.'
      redirect_to(inventories_path)
    else
      render :action => "new"
    end

  end

  def update
    @reference = Inventory.find(params[:id])
    params[:inventory][:who_last] = current_user.login
    @inventories = Inventory.find_by_sql "SELECT i.*
                                          FROM inventories i
                                          WHERE i.id NOT IN (SELECT inventory_id FROM sales)
                                          AND i.product_id = #{@reference.product_id}
                                          AND i.cost = #{@reference.cost}
                                          AND i.tax_ratio = #{@reference.tax_ratio}
                                          AND i.import_ratio = #{@reference.import_ratio}
                                          AND i.currency_ratio = #{@reference.currency_ratio}"

    if @inventories[0].update_attributes(params[:inventory])
      @inventories.each do |inventory|
        inventory.update_attributes(params[:inventory])
      end
      flash[:notice] = 'Inventory(ies) was(were) successfully updated.'
      redirect_to(inventories_path+'?page='+params[:retpage])
    else
      render :action => "edit"
    end
  end

  def clone
    @inventory = Inventory.find(params[:id]).clone
    @inventory.quantity = 1

    @inventory.save
    redirect_to(inventories_path+'?page='+params[:retpage])
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    if not @inventory.destroy
      flash[:notice] = 'No se puede borrar inventario ya que existe en venta'
    end

    redirect_to(inventories_url+'?page='+params[:retpage])
  end

  def calculator
    @tax_ratio = Settings.tax_ratio #0.0825 #***DEFAULT CONFIGURATION VALUE
    @import_ratio = Settings.import_ratio #0.1326 #***DEFAULT CONFIGURATION VALUE
    @currency_ratio = Settings.currency_ratio #13.15 #***DEFAULT CONFIGURATION VALUE
    @top_ratio = Settings.top_ratio #0.70 #***DEFAULT CONFIGURATION VALUE
    @bottom_ratio = Settings.bottom_ratio #0.60 #***DEFAULT CONFIGURATION VALUE
  end

end
