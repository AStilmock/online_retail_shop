class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price, :item_cost, :quantity, :in_stock

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :users, through: :invoice_items
  has_many :discounts, through: :invoice_items
  has_many :purchase_orders

  belongs_to :product_category
  belongs_to :vendor
end