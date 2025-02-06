require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:complete) }
  end

  describe 'associations' do  
    it { should have_many(:purchase_order_items) }
    it { should have_many(:items).through(:purchase_order_items) }
    it { should have_many(:product_categories).through(:items) }
    it { should belong_to(:vendor) }
    it { should belong_to(:user) }
  end

  describe 'active record query methods' do
    it 'finds purchase order by' do
      user = User.create!(email: 'sandemasmail@email.com', password: 'beexcellent', password_confirmation: 'beexcellent')
      vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dimas, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
        )
      category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      item1 = category.items.create!(name: 'Item 1', description: 'Description 1', unit_price: 1.0, item_cost: 0.5, quantity: 10, in_stock: true, vendor_id: vendor.id)
      po = PurchaseOrder.create!(description: 'Purchase Order 1', quantity: 1, complete: true, user_id: user.id, vendor_id: vendor.id, item_id: item1.id)
      expect(PurchaseOrder.vendor_purchase_orders(vendor.id)).to eq([po])
    end

    it 'finds purchase orders by item' do
      user = User.create!(email: 'sandemasmail@email.com', password: 'beexcellent', password_confirmation: 'beexcellent')
      vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dimas, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
        )
      category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      item1 = category.items.create!(name: 'Item 1', description: 'Description 1', unit_price: 1.0, item_cost: 0.5, quantity: 10, in_stock: true, vendor_id: vendor.id)
      po = PurchaseOrder.create!(description: 'Purchase Order 1', quantity: 1, complete: true, user_id: user.id, vendor_id: vendor.id, item_id: item1.id)
      expect(PurchaseOrder.item_purchase_orders(item1.id)).to eq([po])
    end
  end
end