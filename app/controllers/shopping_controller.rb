class ShoppingController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    # require 'pry'; binding.pry
    @items = Item.all
    # @shirts = Item.find(category: 'Shirts')
    # @hoodies = Item.find(category: 'Hoodies')
    # @hats = Item.find(category: 'Hats')
    # @stickers = Item.find(category: 'Stickers')

    @categories = ProductCategory.all
    # @shirt_category = ProductCategory.find(description: 'T-shirt')
    # @hoodie_category = ProductCategory.find(description: 'Hoodie')
    # @hat_category = ProductCategory.find(description: 'Hat')
    # @stickers_category = ProductCategory.find(description: 'Sticker')
  end
end