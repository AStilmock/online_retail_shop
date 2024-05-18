class Sale < ApplicationRecord
  validates_presence_of :sub_total_sale_price, :shipping, :taxes, :total_sale_price, :complete

  has_many :sale_invoices
  has_many :sales, through: :sale_invoices
  has_many :invoices, through: :sale_invoices
  has_many :users, through: :sale_invoices
  has_many :discounts, through: :sale_invoices
end