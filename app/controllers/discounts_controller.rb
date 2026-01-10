class DiscountsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @discounts = Discount.all
  end

  def show
    @discount = Discount.find(params[:id])
  end
end
