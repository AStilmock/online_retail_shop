require 'rails_helper'

RSpec.describe 'Purchase Order Items Index Page', type: :feature do
  describe 'GET /purchase_order_items' do
    before :each do
      @category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      
      @vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dima, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
      )

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
      
      @purchase_order_item1 = PurchaseOrderItem.create!(
        item_id: @item1.id,
        purchase_order_id: @purchase_order.id,
        quantity: 10
      )
      
      @purchase_order_item2 = PurchaseOrderItem.create!(
        item_id: @item2.id,
        purchase_order_id: @purchase_order.id,
        quantity: 5
      )

      visit purchase_order_items_path
    end

    it 'page has content' do
      expect(page).to have_content('Purchase Order Items Index Page')
      expect(page).to have_content('All Purchase Order Items')
    end

    it 'page has purchase order item links' do
      expect(page).to have_link("Purchase Order Item ##{@purchase_order_item1.id}")
      expect(page).to have_link("Purchase Order Item ##{@purchase_order_item2.id}")
    end

    it 'page shows purchase order item information' do
      expect(page).to have_content(@item1.name)
      expect(page).to have_content(@item2.name)
      expect(page).to have_content(@purchase_order_item1.quantity)
      expect(page).to have_content(@purchase_order_item2.quantity)
    end

    it 'purchase order item link goes to purchase order item show page' do
      click_link("Purchase Order Item ##{@purchase_order_item1.id}")
      expect(current_path).to eq(purchase_order_item_path(@purchase_order_item1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
