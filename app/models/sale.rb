class Sale < ApplicationRecord
  validates_presence_of :sub_total_sale_price, :shipping, :taxes, :total_sale_price, :complete

  has_many :sale_invoices
  has_many :sales, through: :sale_invoices
  has_many :invoices, through: :sale_invoices
  has_many :users, through: :sale_invoices
  has_many :discounts, through: :sale_invoices

  def self.all_sales
    Sale.where(complete: true)
  end

  def self.sales_by_date(date)
    Sale.where(created_at: date.beginning_of_day..date.end_of_day)
  end

  def sales_by_date_range(x,y)
    Sale.where('date_time >= ? AND date_time <= ?', x, y)
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
end