require 'rails_helper'

RSpec.describe 'Invoices Index Page', type: :feature do
  describe 'GET /invoices' do
    before :each do
      @invoice1 = Invoice.create!(date_time: Time.now, sub_total_sale_price: 2500, complete: false)
      @invoice2 = Invoice.create!(date_time: Time.now, sub_total_sale_price: 5000, complete: true)
      @invoice3 = Invoice.create!(date_time: Time.now, sub_total_sale_price: 7500, complete: false)

      visit invoices_path
    end

    it 'page has content' do
      expect(page).to have_content('Invoices Index Page')
      expect(page).to have_content('All Invoices')
    end

    it 'page has invoice links' do
      expect(page).to have_link("Invoice ##{@invoice1.id}")
      expect(page).to have_link("Invoice ##{@invoice2.id}")
      expect(page).to have_link("Invoice ##{@invoice3.id}")
    end

    it 'page shows invoice information' do
      expect(page).to have_content('$25.00')
      expect(page).to have_content('$50.00')
      expect(page).to have_content('$75.00')
      expect(page).to have_content('Complete')
      expect(page).to have_content('Pending')
    end

    it 'invoice link goes to invoice show page' do
      click_link("Invoice ##{@invoice1.id}")
      expect(current_path).to eq(invoice_path(@invoice1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
