class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price, :item_cost, :quantity, :in_stock

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :users, through: :invoice_items
  has_many :discounts, through: :invoice_items
  has_many :purchase_order_items

  belongs_to :product_category
  belongs_to :vendor

  def items_by_vendor(venid)
    Item.where(vendor_id: venid)
  end

  def items_by_category(catid)
    Item.where(product_category_id: catid)
  end
end