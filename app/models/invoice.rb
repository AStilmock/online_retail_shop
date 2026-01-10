class Invoice < ApplicationRecord
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :discounts, through: :invoice_items
  has_many :users, through: :invoice_items
  has_many :sale_invoices
  has_many :sales, through: :sale_invoices

  validates_presence_of :date_time, :sub_total_sale_price, :complete
end