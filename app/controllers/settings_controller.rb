class SettingsController < ApplicationController
  before_filter :login_required
  before_filter :authorized_login_required, :except => [ :index ]

  def index
  end

  def update
    flash[:notice] = "Configuration saved."

    Settings.purchase_date = Time.local(params[:settings]['purchase_date(1i)'],params[:settings]["purchase_date(2i)"],params[:settings]["purchase_date(3i)"])
    Settings.tax_ratio = params[:settings][:tax_ratio]
    Settings.import_ratio = params[:settings][:import_ratio]
    Settings.currency_ratio = params[:settings][:currency_ratio]
    Settings.top_ratio = params[:settings][:top_ratio]
    Settings.bottom_ratio = params[:settings][:bottom_ratio]
    redirect_to :action => 'index'
  end
end
