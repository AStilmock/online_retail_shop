class CategoriesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @categories = ProductCategory.all
  end

  def show
    @category = ProductCategory.find(params[:id])
    @items = Item.where(product_category_id: params[:id])
  end
end