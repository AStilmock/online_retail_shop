class ProductCategory < ApplicationRecord
  validates_presence_of :name, :description

  has_many :items
  has_many :vendors, through: :items
end