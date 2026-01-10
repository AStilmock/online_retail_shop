require 'rails_helper'

RSpec.describe 'Vendors Index Page', type: :feature do
  describe 'GET /vendors' do
    before :each do
      @vendor1 = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dima, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
      )
      
      @vendor2 = Vendor.create!(
        name: 'Awesome Merch Co', 
        description: 'Awesome merchandise', 
        address: '5678 Cool St, Los Angeles, CA 90001', 
        email: 'awesome@example.com', 
        phone: '555-1234-5678'
      )

      @category = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      @item1 = @category.items.create!(name: 'T-shirt 1', description: 'T-shirt', unit_price: 2500, item_cost: 1000, quantity: 100, in_stock: true, vendor_id: @vendor1.id)
      @item2 = @category.items.create!(name: 'T-shirt 2', description: 'T-shirt', unit_price: 3000, item_cost: 1200, quantity: 100, in_stock: true, vendor_id: @vendor1.id)

      visit vendors_path
    end

    it 'page has content' do
      expect(page).to have_content('Vendors Index Page')
      expect(page).to have_content('All Vendors')
    end

    it 'page has vendor links' do
      expect(page).to have_link(@vendor1.name)
      expect(page).to have_link(@vendor2.name)
    end

    it 'page shows vendor information' do
      expect(page).to have_content(@vendor1.email)
      expect(page).to have_content(@vendor2.email)
      expect(page).to have_content(@vendor1.phone)
      expect(page).to have_content(@vendor2.phone)
      expect(page).to have_content('2')
    end

    it 'vendor link goes to vendor show page' do
      click_link(@vendor1.name)
      expect(current_path).to eq(vendor_path(@vendor1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
