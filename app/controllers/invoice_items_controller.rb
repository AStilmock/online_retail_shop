class InvoiceItemsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @invoice_items = InvoiceItem.all
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
  end
end
