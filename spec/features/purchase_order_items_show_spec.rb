require 'rails_helper'

RSpec.describe 'Purchase Order Item Show Page', type: :feature do
  describe 'GET /purchase_order_items/:id' do
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
      
      @purchase_order = PurchaseOrder.create!(
        date_time: Time.now,
        description: 'Order 1',
        quantity: 10,
        complete: false,
        user_id: @user.id,
        vendor_id: @vendor.id,
        item_id: @item.id
      )
      
      @purchase_order_item = PurchaseOrderItem.create!(
        item_id: @item.id,
        purchase_order_id: @purchase_order.id,
        quantity: 10
      )
    end

    it 'page has content' do
      visit purchase_order_item_path(@purchase_order_item.id)
      expect(page).to have_content('Purchase Order Item Show Page')
      expect(page).to have_content("Purchase Order Item ##{@purchase_order_item.id}")
    end

    it 'page shows purchase order item details' do
      visit purchase_order_item_path(@purchase_order_item.id)
      expect(page).to have_link(@item.name)
      expect(page).to have_content(@purchase_order_item.quantity)
      expect(page).to have_link("Purchase Order ##{@purchase_order.id}")
    end

    it 'has back to purchase order items link' do
      visit purchase_order_item_path(@purchase_order_item.id)
      expect(page).to have_link('Back to Purchase Order Items')
    end

    it 'has home link' do
      visit purchase_order_item_path(@purchase_order_item.id)
      expect(page).to have_link('Home')
    end
  end
end
