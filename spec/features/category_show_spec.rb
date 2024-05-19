require 'rails_helper'

RSpec.describe 'Product Category Show Page', type: :feature do
  describe 'GET /categories/:id' do
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
    end

    it 't-shirts page shows shirts items info' do
      visit "/categories/#{@category1.id}"
      expect(page).to have_content("Find yer loot for all #{@category1.name} here!")
      expect(page).to have_link(@item1.name)
      expect(page).to have_link(@item2.name)
    end

    it 'hoodies page shows hoodies items info' do
      visit "/categories/#{@category2.id}"
      expect(page).to have_content("Find yer loot for all #{@category2.name} here!")
      expect(page).to have_link(@item3.name)
      expect(page).to have_link(@item4.name)
    end

    it 'hats page shows shirts hats info' do
      visit "/categories/#{@category3.id}"
      expect(page).to have_content("Find yer loot for all #{@category3.name} here!")
      expect(page).to have_link(@item5.name)
      expect(page).to have_link(@item6.name)
    end

    it 'stickers page shows stickers items info' do
      visit "/categories/#{@category4.id}"
      expect(page).to have_content("Find yer loot for all #{@category4.name} here!")
      expect(page).to have_link(@item7.name)
      expect(page).to have_link(@item8.name)
      expect(page).to have_link(@item9.name)
    end

    it 'tshirt links go to tshirt item show page' do
      visit "/categories/#{@category1.id}"
      click_link @item1.name
      expect(current_path).to eq(items_path(@item1.id))
    end

    it 'hoodie links go to hoodie item show page' do
      visit "/categories/#{@category2.id}"
      click_link @item3.name
      expect(current_path).to eq(items_path(@item3.id))
    end

    it 'hat links go to hat item show page' do
      visit "/categories/#{@category3.id}"
      click_link @item5.name
      expect(current_path).to eq(items_path(@item5.id))
    end

    it 'sticker links go to sticker item show page' do
      visit "/categories/#{@category4.id}"
      click_link @item7.name
      expect(current_path).to eq(items_path(@item7.id))
    end
  end
end