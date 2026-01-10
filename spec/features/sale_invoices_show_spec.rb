require 'rails_helper'

RSpec.describe 'Sale Invoice Show Page', type: :feature do
  describe 'GET /sale_invoices/:id' do
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
      @sale = Sale.create!(date_time: Time.now, sub_total_sale_price: 2500, shipping: 500, taxes: 200, total_sale_price: 3200, complete: true)
      @sale_invoice = SaleInvoice.create!(sale_id: @sale.id, invoice_id: @invoice.id, user_id: @user.id, discount_id: @discount.id, date_time: Time.now)
    end

    it 'page has content' do
      visit sale_invoice_path(@sale_invoice.id)
      expect(page).to have_content('Sale Invoice Show Page')
      expect(page).to have_content("Sale Invoice ##{@sale_invoice.id}")
    end

    it 'page shows sale invoice details' do
      visit sale_invoice_path(@sale_invoice.id)
      expect(page).to have_link("Sale ##{@sale.id}")
      expect(page).to have_link("Invoice ##{@invoice.id}")
      expect(page).to have_link(@user.email)
      expect(page).to have_link(@discount.name)
    end

    it 'has back to sale invoices link' do
      visit sale_invoice_path(@sale_invoice.id)
      expect(page).to have_link('Back to Sale Invoices')
    end

    it 'has home link' do
      visit sale_invoice_path(@sale_invoice.id)
      expect(page).to have_link('Home')
    end
  end
end
