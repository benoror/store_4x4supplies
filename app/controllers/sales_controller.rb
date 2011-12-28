class SalesController < ApplicationController
  before_filter :login_required

  def index
    @sales = Sale.all :order => "created_at DESC"
  end

  def new
    @sale = Sale.new
    @sale.inventory = Inventory.find_by_product_id(params[:pid], :conditions => "id NOT IN (SELECT inventory_id FROM sales)")
    
    @inventory = @sale.inventory
    @price = ((@inventory.cost * (1+@inventory.top_ratio) * (1+@inventory.tax_ratio) * (1+@inventory.import_ratio) * @inventory.currency_ratio)/10).ceil*10
  end

  def edit
    @sale = Sale.find(params[:id])
    @inventory = @sale.inventory
  end

  def create
    @sale = Sale.new(params[:sale])
    @sale.inventory = Inventory.find(params[:sale][:inventory_id])
    @sale.who = current_user.login
    @sale.who_last = current_user.login
    
    @inventory = @sale.inventory
    @price = ((@inventory.cost * (1+@inventory.top_ratio) * (1+@inventory.tax_ratio) * (1+@inventory.import_ratio) * @inventory.currency_ratio)/10).ceil*10

    if @sale.save
      flash[:notice] = 'Sale was successfully created.'
      redirect_to(sales_url)
    else
      render :action => "new"
    end

  end

  # PUT /sales/1
  # PUT /sales/1.xml
  def update
    @sale = Sale.find(params[:id])
    @sale.who_last = current_user.login

    if @sale.update_attributes(params[:sale])
      flash[:notice] = 'Sale was successfully updated.'
      redirect_to(sales_url)
    else
      render :action => "edit"
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    redirect_to(sales_url)
  end
end
