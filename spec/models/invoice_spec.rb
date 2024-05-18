require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:date_time)}
    it { should validate_presence_of(:sub_total_sale_price)}
    it { should validate_presence_of(:complete)}
  end 

  describe 'associations' do  
    it { should have_many(:invoice_items) }
    it { should have_many(:items).through(:invoice_items) }
    it { should have_many(:discounts).through(:invoice_items) }
    it { should have_many(:sale_invoices) }
    it { should have_many(:sales).through(:sale_invoices) }
  end
end