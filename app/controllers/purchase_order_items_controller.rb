class PurchaseOrderItemsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @purchase_order_items = PurchaseOrderItem.all
  end

  def show
    @purchase_order_item = PurchaseOrderItem.find(params[:id])
  end
end
