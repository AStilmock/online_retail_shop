require 'rails_helper'

RSpec.describe 'Vendor Show Page', type: :feature do
  describe 'GET /vendors/:id' do
    before :each do
      @vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dima, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
      )

      @category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      @item1 = @category.items.create!(name: 'T-shirt 1', description: 'T-shirt', unit_price: 2500, item_cost: 1000, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item2 = @category.items.create!(name: 'T-shirt 2', description: 'T-shirt', unit_price: 3000, item_cost: 1200, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      
      @user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      @purchase_order = PurchaseOrder.create!(
        date_time: Time.now,
        description: 'Order 1',
        quantity: 10,
        complete: false,
        user_id: @user.id,
        vendor_id: @vendor.id,
        item_id: @item1.id
      )
    end

    it 'page has content' do
      visit vendor_path(@vendor.id)
      expect(page).to have_content('Vendor Show Page')
      expect(page).to have_content(@vendor.name)
    end

    it 'page shows vendor details' do
      visit vendor_path(@vendor.id)
      expect(page).to have_content(@vendor.description)
      expect(page).to have_content(@vendor.address)
      expect(page).to have_content(@vendor.email)
      expect(page).to have_content(@vendor.phone)
    end

    it 'page shows vendor items' do
      visit vendor_path(@vendor.id)
      expect(page).to have_content('Items from this Vendor')
      expect(page).to have_link(@item1.name)
      expect(page).to have_link(@item2.name)
      expect(page).to have_content('$25.00')
      expect(page).to have_content('$30.00')
    end

    it 'page shows purchase orders' do
      visit vendor_path(@vendor.id)
      expect(page).to have_content('Purchase Orders')
      expect(page).to have_link("Purchase Order ##{@purchase_order.id}")
      expect(page).to have_content(@item1.name)
      expect(page).to have_content('Pending')
    end

    it 'has back to vendors link' do
      visit vendor_path(@vendor.id)
      expect(page).to have_link('Back to Vendors')
    end

    it 'has home link' do
      visit vendor_path(@vendor.id)
      expect(page).to have_link('Home')
    end
  end
end
