class CategoriesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
  end

  def show
    # require 'pry'; binding.pry
    @category = ProductCategory.find(params[:id])
    @items = Item.where(product_category_id: params[:id])
  end
end