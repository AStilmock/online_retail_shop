class Vendor < ApplicationRecord
  has_many :items
  has_many :product_categories, through: :items
  has_many :purchase_orders

  validates_presence_of :name, :description, :address, :email, :phone
end