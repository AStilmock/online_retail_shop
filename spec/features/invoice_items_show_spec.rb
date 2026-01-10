require 'rails_helper'

RSpec.describe 'Invoice Item Show Page', type: :feature do
  describe 'GET /invoice_items/:id' do
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
      @user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      @invoice = Invoice.create!(date_time: Time.now, sub_total_sale_price: 2500, complete: false)
      @invoice_item = InvoiceItem.create!(user_id: @user.id, invoice_id: @invoice.id, item_id: @item.id, discount_id: @discount.id, quantity: 2)
    end

    it 'page has content' do
      visit invoice_item_path(@invoice_item.id)
      expect(page).to have_content('Invoice Item Show Page')
      expect(page).to have_content("Invoice Item ##{@invoice_item.id}")
    end

    it 'page shows invoice item details' do
      visit invoice_item_path(@invoice_item.id)
      expect(page).to have_link(@item.name)
      expect(page).to have_content(@invoice_item.quantity)
      expect(page).to have_link("Invoice ##{@invoice.id}")
      expect(page).to have_link(@user.email)
      expect(page).to have_link(@discount.name)
    end

    it 'has back to invoice items link' do
      visit invoice_item_path(@invoice_item.id)
      expect(page).to have_link('Back to Invoice Items')
    end

    it 'has home link' do
      visit invoice_item_path(@invoice_item.id)
      expect(page).to have_link('Home')
    end
  end
end
