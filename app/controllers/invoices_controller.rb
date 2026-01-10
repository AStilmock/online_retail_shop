class InvoicesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
    @invoice_items = @invoice.invoice_items
  end
end
