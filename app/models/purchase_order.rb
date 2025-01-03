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

  def user_purchase_orders(userid)
    PurchaseOrder.where(user_id: userid)
  end
end