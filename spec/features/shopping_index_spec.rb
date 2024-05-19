require 'rails_helper'

RSpec.describe 'Shopping Index Page', type: :feature do
  describe 'GET /shopping' do
    before :each do
      @category1 = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      @category2 = ProductCategory.create!(name: 'Hoodies', description: 'Hoodies')
      @category3 = ProductCategory.create!(name: 'Hats', description: 'Hats')
      @category4 = ProductCategory.create!(name: 'Stickers', description: 'Stickers')

      @vendor = Vendor.create!(
        name: 'Bill & Teds excellent merchandise', 
        description: 'Merchandise for Bill & Ted fans', 
        address: '1234 Wyld Stallyns Way, San Dima, CA 91773', 
        email: 'beexcellent@gmail.com', 
        phone: '555-555-5555'
        )

      @item1 = @category1.items.create!(name: 'T-shirt 1', description: 'T-shirt', unit_price: 25.00, item_cost: 10.00, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item2 = @category1.items.create!(name: 'T-shirt 2', description: 'T-shirt', unit_price: 25.00, item_cost: 10.00, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item3 = @category2.items.create!(name: 'Hoodie 1', description: 'Hoodie', unit_price: 45.00, item_cost: 15.00, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item4 = @category2.items.create!(name: 'Hoodie 2', description: 'Hoodie', unit_price: 45.00, item_cost: 15.00, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item5 = @category3.items.create!(name: 'Hat 1', description: 'Hat', unit_price: 35.00, item_cost: 5.00, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item6 = @category3.items.create!(name: 'Hat 2', description: 'Hat', unit_price: 35.00, item_cost: 5.00, quantity: 100, in_stock: true, vendor_id: @vendor.id)
      @item7 = @category4.items.create!(name: 'Sticker 1', description: 'Sticker', unit_price: 5.00, item_cost: 1.00, quantity: 1000, in_stock: true, vendor_id: @vendor.id)
      @item8 = @category4.items.create!(name: 'Sticker 2', description: 'Sticker', unit_price: 5.00, item_cost: 1.00, quantity: 1000, in_stock: true, vendor_id: @vendor.id)
      @item9 = @category4.items.create!(name: 'Sticker 3', description: 'Sticker', unit_price: 5.00, item_cost: 1.00, quantity: 1000, in_stock: true, vendor_id: @vendor.id)

      visit shopping_path
    end

    it 'page has content' do
      expect(page).to have_content('Here be the shopping page - view our inventory selection below!')
      expect(page).to have_content('Sample Item List')
      expect(page).to have_content('Product Category List')
    end

    it 'page has category links' do
      expect(page).to have_link(@category1.name)
      expect(page).to have_link(@category2.name)
      expect(page).to have_link(@category3.name)
      expect(page).to have_link(@category4.name)
    end

    it 'page has item links' do
      expect(page).to have_link(@item1.name)
      expect(page).to have_link(@item2.name)
      expect(page).to have_link(@item3.name)
      expect(page).to have_link(@item4.name)
      expect(page).to have_link(@item5.name)
      expect(page).to have_link(@item6.name)
      expect(page).to have_link(@item7.name)
      expect(page).to have_link(@item8.name)
      expect(page).to have_link(@item9.name)
    end

    it 'shirts link goes to shirt category show page' do
      click_link(@category1.name)
      expect(current_path).to eq(shopping_category_path(@category1.id))
    end

    it 'hoodies link goes to hoodie category show page' do 
      click_link(@category2.name)
      expect(current_path).to eq(shopping_category_path(@category2.id))
    end

    it 'hats link goes to hat category show page' do 
      click_link(@category3.name)
      expect(current_path).to eq(shopping_category_path(@category3.id))
    end

    it 'stickers link goes to sticker category show page' do 
      click_link(@category4.name)
      expect(current_path).to eq(shopping_category_path(@category4.id))
    end

    it 'shirt link goes to shirt item show page' do
      click_link(@item1.name)
      expect(current_path).to eq(items_path(@item1.id))
    end
    
    it 'hoodie link goes to hoodie item show page' do
      click_link(@item3.name)
      expect(current_path).to eq(items_path(@item3.id))
    end
    
    it 'hat link goes to hat item show page' do
      click_link(@item5.name)
      expect(current_path).to eq(items_path(@item5.id))
    end
    
    it 'sticker link goes to sticker item show page' do
      click_link(@item7.name)
      expect(current_path).to eq(items_path(@item7.id))
    end
  end
end