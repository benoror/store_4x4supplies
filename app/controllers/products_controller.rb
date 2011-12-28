class ProductsController < ApplicationController
  before_filter :login_required

  def index

    @sql = "SELECT * FROM products
            WHERE 1=1 "

    if params[:search]
      @sql += "AND (barcode LIKE '%#{params[:search]}%' OR name LIKE '%#{params[:search]}%') "
    end

    if params[:cat]
      @sql += "AND category_id = #{params[:cat]} "
    elsif params[:sup]
      @sql += "AND supplier_id = #{params[:sup]} "
    end

    @sql += "ORDER BY created_at DESC"

    @products = Product.paginate_by_sql @sql, :page => params[:page], :per_page => 20
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    @product.who = current_user.login
    @product.who_last = current_user.login

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to(@product)
    else
      render :action => "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.who_last = current_user.login

    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
      redirect_to(@product)
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    
    if not @product.destroy
      flash[:notice] = 'No se puede borrar producto ya que existe en inventario'
    end

    redirect_to(products_url)
  end

end
