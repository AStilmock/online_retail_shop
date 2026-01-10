require 'rails_helper'

RSpec.describe 'Invoice Items Index Page', type: :feature do
  describe 'GET /invoice_items' do
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
      @discount = Discount.create!(name: 'Summer Sale', category: 'Seasonal', description: 'Summer discount', price_percent: 20, amount: 500)
      @user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      @invoice = Invoice.create!(date_time: Time.now, sub_total_sale_price: 2500, complete: false)
      @invoice_item1 = InvoiceItem.create!(user_id: @user.id, invoice_id: @invoice.id, item_id: @item1.id, discount_id: @discount.id, quantity: 1)
      @invoice_item2 = InvoiceItem.create!(user_id: @user.id, invoice_id: @invoice.id, item_id: @item2.id, discount_id: @discount.id, quantity: 2)

      visit invoice_items_path
    end

    it 'page has content' do
      expect(page).to have_content('Invoice Items Index Page')
      expect(page).to have_content('All Invoice Items')
    end

    it 'page has invoice item links' do
      expect(page).to have_link("Invoice Item ##{@invoice_item1.id}")
      expect(page).to have_link("Invoice Item ##{@invoice_item2.id}")
    end

    it 'page shows invoice item information' do
      expect(page).to have_content(@item1.name)
      expect(page).to have_content(@item2.name)
      expect(page).to have_content(@invoice_item1.quantity)
      expect(page).to have_content(@invoice_item2.quantity)
    end

    it 'invoice item link goes to invoice item show page' do
      click_link("Invoice Item ##{@invoice_item1.id}")
      expect(current_path).to eq(invoice_item_path(@invoice_item1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
