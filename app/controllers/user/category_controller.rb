class User::CategoryController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
  end

  def show
    @user = current_user
    @category = ProductCategory.find(params[:id])
    @items = Item.where(product_category_id: params[:id])
  end
end