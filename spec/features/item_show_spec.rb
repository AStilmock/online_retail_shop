require 'rails_helper'

RSpec.describe 'Item Show Page' do
  describe 'GET /items/:id' do
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

    it 'page shows content' do
      visit "/items/#{@item1.id}"
      expect(page).to have_content("Find the details for #{@item1.name} here!")
    end

    it 'page shows shirt items info' do
      visit "/items/#{@item1.id}"
      expect(page).to have_content(@item1.description)
    end

    it 'page shows hoodie items info' do
      visit "/items/#{@item3.id}"
      expect(page).to have_content(@item3.description)
    end

    it 'page shows hate items info' do
      visit "/items/#{@item5.id}"
      expect(page).to have_content(@item5.description)
    end

    it 'page shows hat items info' do
      visit "/items/#{@item7.id}"
      expect(page).to have_content(@item7.description)
    end
  end
end