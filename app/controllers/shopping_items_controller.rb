class ShoppingItemsController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def show
    @category = ProductCategory.find(params[:id])
  end
end