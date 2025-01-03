class ProductCategory < ApplicationRecord
  validates_presence_of :name, :description

  has_many :items
  has_many :vendors, through: :items

  def category_items(catid)
    Item.where(product_category_id: catid)
  end

  
end