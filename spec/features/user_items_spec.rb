require 'rails_helper'

RSpec.describe 'User Items Page', type: :feature do
  describe 'GET /user/:id/items/:id' do
    before :each do 
      @user = User.create!(email: 'sandemasmail@email.com', password: 'beexcellent', password_confirmation: 'beexcellent')

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

      visit login_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: "beexcellent"
      click_button 'Login'
      click_link('Shopping Page')
    end

    it 'page shows content' do
      click_link("#{@item1.name}")
      expect(current_path).to eq(user_item_path(@item1.id))
      expect(page).to have_content("Hello #{@user.email}")
      expect(page).to have_content("Find the details for #{@item1.name} here!")
      expect(page).to have_content("#{@item1.description}")
    end

    it 'page shows content' do
      click_link("#{@item3.name}")
      expect(current_path).to eq(user_item_path(@item3.id))
      expect(page).to have_content("Hello #{@user.email}")
      expect(page).to have_content("Find the details for #{@item3.name} here!")
      expect(page).to have_content("#{@item3.description}")
    end

    it 'page shows content' do
      click_link("#{@item5.name}")
      expect(current_path).to eq(user_item_path(@item5.id))
      expect(page).to have_content("Hello #{@user.email}")
      expect(page).to have_content("Find the details for #{@item5.name} here!")
      expect(page).to have_content("#{@item5.description}")
    end

    it 'page shows content' do
      click_link("#{@item7.name}")
      expect(current_path).to eq(user_item_path(@item7.id))
      expect(page).to have_content("Hello #{@user.email}")
      expect(page).to have_content("Find the details for #{@item7.name} here!")
      expect(page).to have_content("#{@item7.description}")
    end
  end
end