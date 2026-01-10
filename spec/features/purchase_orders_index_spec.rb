require 'rails_helper'

RSpec.describe 'Purchase Orders Index Page', type: :feature do
  describe 'GET /purchase_orders' do
    before :each do
      @category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      
      @vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dima, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
      )

      @item = @category.items.create!(name: 'T-shirt 1', description: 'T-shirt', unit_price: 2500, item_cost: 1000, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      
      @purchase_order1 = PurchaseOrder.create!(
        date_time: Time.now,
        description: 'Order 1',
        quantity: 10,
        complete: false,
        user_id: @user.id,
        vendor_id: @vendor.id,
        item_id: @item.id
      )
      
      @purchase_order2 = PurchaseOrder.create!(
        date_time: Time.now,
        description: 'Order 2',
        quantity: 20,
        complete: true,
        user_id: @user.id,
        vendor_id: @vendor.id,
        item_id: @item.id
      )

      visit purchase_orders_path
    end

    it 'page has content' do
      expect(page).to have_content('Purchase Orders Index Page')
      expect(page).to have_content('All Purchase Orders')
    end

    it 'page has purchase order links' do
      expect(page).to have_link("Purchase Order ##{@purchase_order1.id}")
      expect(page).to have_link("Purchase Order ##{@purchase_order2.id}")
    end

    it 'page shows purchase order information' do
      expect(page).to have_content(@vendor.name)
      expect(page).to have_content(@item.name)
      expect(page).to have_content(@purchase_order1.quantity)
      expect(page).to have_content(@purchase_order2.quantity)
      expect(page).to have_content('Complete')
      expect(page).to have_content('Pending')
    end

    it 'purchase order link goes to purchase order show page' do
      click_link("Purchase Order ##{@purchase_order1.id}")
      expect(current_path).to eq(purchase_order_path(@purchase_order1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
