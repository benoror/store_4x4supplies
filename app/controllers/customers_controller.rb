class CustomersController < ApplicationController
  before_filter :login_required

  def index
    @customers = Customer.all(:order => 'created_at DESC')
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.who = current_user.login
    @customer.who_last = current_user.login

    if @customer.save
      flash[:notice] = 'Customer was successfully created.'
      redirect_to(customers_path)
    else
      render :action => "new"
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.who_last = current_user.login

    if @customer.update_attributes(params[:customer])
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to(customers_path)
    else
      render :action => "edit"
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to(customers_url)
  end
end
