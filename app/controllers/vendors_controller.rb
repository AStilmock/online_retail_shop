class VendorsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @items = @vendor.items
    @purchase_orders = @vendor.purchase_orders
  end
end
