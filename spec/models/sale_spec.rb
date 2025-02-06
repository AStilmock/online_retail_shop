require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:sub_total_sale_price) }
    it { should validate_presence_of(:shipping) }
    it { should validate_presence_of(:taxes) }
    it { should validate_presence_of(:total_sale_price) }
    it { should validate_presence_of(:complete) }
  end

  describe 'associations' do  
    it { should have_many(:sale_invoices) }
    it { should have_many(:sales).through(:sale_invoices) }
    it { should have_many(:invoices).through(:sale_invoices) }
    it { should have_many(:users).through(:sale_invoices) }
    it { should have_many(:discounts).through(:sale_invoices) }
  end

  describe 'active record query methods' do
    before :each do
      @sale1 = Sale.create!(sub_total_sale_price: 10, shipping: 1, taxes: 1, total_sale_price: 12, complete: true)
      @sale2 = Sale.create!(sub_total_sale_price: 10, shipping: 1, taxes: 1, total_sale_price: 12, complete: true)
    end
    it 'finds all sales' do
      expect(Sale.all_sales).to eq([@sale1, @sale2])
    end

    it 'finds sales by date' do
      date = Date.today
      expect(Sale.sales_by_date(date)).to eq([@sale1, @sale2])
    end

    xit 'finds sales by date range' do
      date1 = Date.yesterday
      date2 = Date.tomorrow
      expect(Sale.sales_by_date_range(date1, date2)).to eq([@sale1, @sale2])
    end

    it 'finds sales by item category' do

    end

    it 'finds sales revenue' do

    end

    it 'finds sales revenue by category' do

    end
  end
end