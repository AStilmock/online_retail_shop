class Invoice < ApplicationRecord
  has_many :invoice_items
  has_many :sale_invoices
end