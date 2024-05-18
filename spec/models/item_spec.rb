require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:item_cost) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:in_stock) }
  end

  describe 'associations' do  
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should have_many(:users).through(:invoice_items) }
    it { should have_many(:discounts).through(:invoice_items) }
    it { should have_many(:purchase_order_items) }

    it { should belong_to(:product_category) }
    it { should belong_to(:vendor) }
  end
end