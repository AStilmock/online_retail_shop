class PurchaseOrdersController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @purchase_orders = PurchaseOrder.all
  end

  def show
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order_items = @purchase_order.purchase_order_items
  end
end
