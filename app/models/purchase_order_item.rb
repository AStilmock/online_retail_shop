class PurchaseOrderItem < ApplicationRecord
  validates_presence_of :quantity

  belongs_to :item
  belongs_to :purchase_order
end