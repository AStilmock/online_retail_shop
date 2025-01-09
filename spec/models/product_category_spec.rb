require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
  end

  describe 'associations' do  
    it { should have_many(:items) }
    it { should have_many(:vendors).through(:items) }
  end

  describe 'active record query methods' do
    it 'should return items by category' do
      vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dimas, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
        )
      category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      item1 = category.items.create!(name: 'Item 1', description: 'Description 1', unit_price: 1.0, item_cost: 0.5, quantity: 10, in_stock: true, vendor_id: vendor.id)
      item2 = category.items.create!(name: 'Item 2', description: 'Description 2', unit_price: 1.0, item_cost: 0.5, quantity: 10, in_stock: true, vendor_id: vendor.id)
      expect(category.category_items(category.id)).to eq([item1, item2])
    end
  end
end