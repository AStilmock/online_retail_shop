class ShoppingController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @items = Item.all
    @categories = ProductCategory.all
  end
end