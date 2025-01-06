class PurchaseOrder < ApplicationRecord
  validates_presence_of :description, :quantity, :complete

  has_many :purchase_order_items
  has_many :items, through: :purchase_order_items
  has_many :product_categories, through: :items
  
  belongs_to :vendor
  belongs_to :user

  def vendor_purchase_orders(vendid)
    PurchaseOrder.where(vendor_id: vendid)
  end

  def item_purchase_orders(itemid)
    PurchaseOrder.where(item_id: itemid)
  end

  def item_cost(purch_order)
    purch_order.items.map { |i| i.item_cost }.sum
  end
end