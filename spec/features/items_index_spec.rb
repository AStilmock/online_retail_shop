require 'rails_helper'

RSpec.describe 'Items Index Page', type: :feature do
  describe 'GET /items' do
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
      @item2 = @category.items.create!(name: 'T-shirt 2', description: 'T-shirt', unit_price: 2500, item_cost: 1000, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item3 = @category.items.create!(name: 'T-shirt 3', description: 'T-shirt', unit_price: 3000, item_cost: 1200, quantity: 0, in_stock: false, vendor_id: @vendor.id)

      visit items_path
    end

    it 'page has content' do
      expect(page).to have_content('Items Index Page')
      expect(page).to have_content('All Items')
    end

    it 'page has item links' do
      expect(page).to have_link(@item1.name)
      expect(page).to have_link(@item2.name)
      expect(page).to have_link(@item3.name)
    end

    it 'page shows item prices' do
      expect(page).to have_content('$25.00')
      expect(page).to have_content('$30.00')
    end

    it 'page shows stock status' do
      expect(page).to have_content('In Stock')
      expect(page).to have_content('Out of Stock')
    end

    it 'item link goes to item show page' do
      click_link(@item1.name)
      expect(current_path).to eq(item_path(@item1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end

    it 'has shopping link' do
      expect(page).to have_link('Shopping')
    end
  end
end
