require 'rails_helper'

RSpec.describe 'Discount Show Page', type: :feature do
  describe 'GET /discounts/:id' do
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
      
      @discount = Discount.create!(name: 'Summer Sale', category: 'Seasonal', description: 'Summer discount', price_percent: 20, amount: 500)
      
      @invoice = Invoice.create!(date_time: Time.now, sub_total_sale_price: 2500, complete: false)
      @user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      @invoice_item = InvoiceItem.create!(user_id: @user.id, invoice_id: @invoice.id, item_id: @item.id, discount_id: @discount.id, quantity: 1)
    end

    it 'page has content' do
      visit discount_path(@discount.id)
      expect(page).to have_content('Discount Show Page')
      expect(page).to have_content(@discount.name)
    end

    it 'page shows discount details' do
      visit discount_path(@discount.id)
      expect(page).to have_content(@discount.category)
      expect(page).to have_content(@discount.description)
      expect(page).to have_content('20%')
      expect(page).to have_content('$5.00')
    end

    it 'page shows related items' do
      visit discount_path(@discount.id)
      expect(page).to have_content('Related Items')
      expect(page).to have_link(@item.name)
    end

    it 'has back to discounts link' do
      visit discount_path(@discount.id)
      expect(page).to have_link('Back to Discounts')
    end

    it 'has home link' do
      visit discount_path(@discount.id)
      expect(page).to have_link('Home')
    end
  end
end
