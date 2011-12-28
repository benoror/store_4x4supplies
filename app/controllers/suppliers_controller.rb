class SuppliersController < ApplicationController
  before_filter :login_required

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(params[:supplier])

    if @supplier.save
      flash[:notice] = 'Supplier was successfully created.'
      redirect_to(suppliers_path)
    else
      render :action => "new"
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    if @supplier.update_attributes(params[:supplier])
      flash[:notice] = 'Supplier was successfully updated.'
      redirect_to(suppliers_path)
    else
      render :action => "edit"
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])

    if not @supplier.destroy
      flash[:notice] = 'No se puede borrar proveedor ya que existe en producto'
    end

    redirect_to(suppliers_url)
  end
end
