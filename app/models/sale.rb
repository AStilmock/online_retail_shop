class Sale < ApplicationRecord
  validates_presence_of :sub_total_sale_price, :shipping, :taxes, :total_sale_price, :complete

  has_many :sale_invoices
  has_many :sales, through: :sale_invoices
  has_many :invoices, through: :sale_invoices
  has_many :users, through: :sale_invoices
  has_many :discounts, through: :sale_invoices

  def all_sales
    Sale.where(complete: true)
  end

  def sale_invoices(saleid)
    SaleInvoice.where(sale_id: saleid)
  end

  def sales_by_category(category)
    Sale.joins(:sales).where('sales.product_category_id = ?', category.id)
  end

  def sales_revenue
    Sale.sum(:total_sale_price)
  end

  def sales_revenue_by_category(category)
    Sale.joins(:sales).where('sales.product_category_id = ?', category.id).sum(:total_sale_price)
  end

  def sales_by_date(date)
    Sale.where('date_time = ?', date)
  end
end