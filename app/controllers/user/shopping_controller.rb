class User::ShoppingController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @user = current_user
    @categories = ProductCategory.all
    @items = Item.all
  end
end