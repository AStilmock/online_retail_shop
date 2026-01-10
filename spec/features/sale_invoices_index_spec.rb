require 'rails_helper'

RSpec.describe 'Sale Invoices Index Page', type: :feature do
  describe 'GET /sale_invoices' do
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
      @user1 = User.create!(email: 'test1@example.com', password: 'password123', password_confirmation: 'password123')
      @user2 = User.create!(email: 'test2@example.com', password: 'password123', password_confirmation: 'password123')
      @invoice1 = Invoice.create!(date_time: Time.now, sub_total_sale_price: 2500, complete: false)
      @invoice2 = Invoice.create!(date_time: Time.now, sub_total_sale_price: 5000, complete: false)
      @sale1 = Sale.create!(date_time: Time.now, sub_total_sale_price: 2500, shipping: 500, taxes: 200, total_sale_price: 3200, complete: true)
      @sale2 = Sale.create!(date_time: Time.now, sub_total_sale_price: 5000, shipping: 1000, taxes: 400, total_sale_price: 6400, complete: true)
      
      @sale_invoice1 = SaleInvoice.create!(sale_id: @sale1.id, invoice_id: @invoice1.id, user_id: @user1.id, discount_id: @discount.id, date_time: Time.now)
      @sale_invoice2 = SaleInvoice.create!(sale_id: @sale2.id, invoice_id: @invoice2.id, user_id: @user2.id, discount_id: @discount.id, date_time: Time.now)

      visit sale_invoices_path
    end

    it 'page has content' do
      expect(page).to have_content('Sale Invoices Index Page')
      expect(page).to have_content('All Sale Invoices')
    end

    it 'page has sale invoice links' do
      expect(page).to have_link("Sale Invoice ##{@sale_invoice1.id}")
      expect(page).to have_link("Sale Invoice ##{@sale_invoice2.id}")
    end

    it 'page shows sale invoice information' do
      expect(page).to have_content(@user1.email)
      expect(page).to have_content(@user2.email)
      expect(page).to have_content("Sale ##{@sale1.id}")
      expect(page).to have_content("Sale ##{@sale2.id}")
    end

    it 'sale invoice link goes to sale invoice show page' do
      click_link("Sale Invoice ##{@sale_invoice1.id}")
      expect(current_path).to eq(sale_invoice_path(@sale_invoice1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
