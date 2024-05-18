class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  belongs_to :user
  belongs_to :discount

  validates_presence_of :quantity
end