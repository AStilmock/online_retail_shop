class Employee < ApplicationRecord
  belongs_to :user

  validates_presence_of :first_name, :last_name, :address, :email, :phone, :category
end