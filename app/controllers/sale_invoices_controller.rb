class SaleInvoicesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @sale_invoices = SaleInvoice.all
  end

  def show
    @sale_invoice = SaleInvoice.find(params[:id])
  end
end
