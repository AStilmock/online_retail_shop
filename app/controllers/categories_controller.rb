class CategoriesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index

  end

  def show
    @category = ProductCategory.find(params[:id])
  end
end