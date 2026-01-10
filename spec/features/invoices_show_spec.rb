require 'rails_helper'

RSpec.describe 'Invoice Show Page', type: :feature do
  describe 'GET /invoices/:id' do
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
      @invoice_item = InvoiceItem.create!(user_id: @user.id, invoice_id: @invoice.id, item_id: @item.id, discount_id: @discount.id, quantity: 1)
      @sale = Sale.create!(date_time: Time.now, sub_total_sale_price: 2500, shipping: 500, taxes: 200, total_sale_price: 3200, complete: true)
      @sale_invoice = SaleInvoice.create!(sale_id: @sale.id, invoice_id: @invoice.id, user_id: @user.id, discount_id: @discount.id, date_time: Time.now)
    end

    it 'page has content' do
      visit invoice_path(@invoice.id)
      expect(page).to have_content('Invoice Show Page')
      expect(page).to have_content("Invoice ##{@invoice.id}")
    end

    it 'page shows invoice details' do
      visit invoice_path(@invoice.id)
      expect(page).to have_content('$25.00')
      expect(page).to have_content('Pending')
    end

    it 'page shows invoice items' do
      visit invoice_path(@invoice.id)
      expect(page).to have_content('Invoice Items')
      expect(page).to have_link(@item.name)
      expect(page).to have_content(@invoice_item.quantity)
    end

    it 'page shows related sales' do
      visit invoice_path(@invoice.id)
      expect(page).to have_content('Related Sales')
      expect(page).to have_link("Sale ##{@sale.id}")
    end

    it 'has back to invoices link' do
      visit invoice_path(@invoice.id)
      expect(page).to have_link('Back to Invoices')
    end

    it 'has home link' do
      visit invoice_path(@invoice.id)
      expect(page).to have_link('Home')
    end
  end
end
