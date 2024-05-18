class Discount < ApplicationRecord
  validates_presence_of :name, :category, :description, :price_percent, :amount

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :users, through: :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :sale_invoices
  has_many :sales, through: :sale_invoices
end