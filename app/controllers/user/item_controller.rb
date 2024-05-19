class User::ItemController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index

  end

  def show
    @item = Item.find(params[:id])
  end
end