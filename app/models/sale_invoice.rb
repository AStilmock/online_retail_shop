class SaleInvoice < ApplicationRecord
  belongs_to :sale
  belongs_to :invoice
  belongs_to :user
end