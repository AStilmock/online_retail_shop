class PurchaseOrder < ApplicationRecord
  validates_presence_of :description, :quantity, :complete

  has_many :purchase_order_items
  has_many :items, through: :purchase_order_items
  has_many :product_categories, through: :items
  
  belongs_to :vendor
  belongs_to :user
end