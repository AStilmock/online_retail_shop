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

  describe 'active record methods' do
    it 'should return items by vendor' do
      vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dimas, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
        )
      category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      item = category.items.create!(name: 'Item 1', description: 'Description 1', unit_price: 1.0, item_cost: 0.5, quantity: 10, in_stock: true, vendor_id: vendor.id)
      expect(Item.items_by_vendor(vendor.id)).to eq([item])
    end

    it 'should return items by category' do
      vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dimas, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
        )
      category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      item = category.items.create!(name: 'Item 1', description: 'Description 1', unit_price: 1.0, item_cost: 0.5, quantity: 10, in_stock: true, vendor_id: vendor.id)
      expect(Item.items_by_category(category.id)).to eq([item])
    end
  end
end