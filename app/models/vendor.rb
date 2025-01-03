class Vendor < ApplicationRecord
  has_many :items
  has_many :product_categories, through: :items
  has_many :purchase_orders

  validates_presence_of :name, :description, :address, :email, :phone

  def vendor_items(venid)
    Item.where(vendor_id: venid)
  end

  def vendor_purchase_orders(venid)
    PurchaseOrder.where(vendor_id: venid)
  end
end