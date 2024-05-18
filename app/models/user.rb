class User < ApplicationRecord
  authenticates_with_sorcery!
  
  has_many :sale_invoices
  has_many :sales, through: :sale_invoices
  has_many :invoice_items
  has_many :invoices, through: :sale_invoices
  has_many :purchase_orders
  
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true
  
  enum permission: [:basic, :employee, :manager, :admin, :super_admin]
  enum discount: [:regular, :FF_Mem, :emp, :mngr, :director_owner]
end
