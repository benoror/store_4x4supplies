class TransactionsController < ApplicationController
  before_filter :login_required
  before_filter :authorized_login_required, :except => [ :index ]

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    @transaction.who = current_user.login

    if @transaction.save
      flash[:notice] = 'Transaction was successfully created.'
      redirect_to(transactions_path)
    else
      render :action => "new"
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    redirect_to(transactions_url)
  end
end
