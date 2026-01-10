class SalesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
    @sale_invoices = @sale.sale_invoices
  end
end
