require 'rails_helper'

RSpec.describe 'Discounts Index Page', type: :feature do
  describe 'GET /discounts' do
    before :each do
      @discount1 = Discount.create!(name: 'Summer Sale', category: 'Seasonal', description: 'Summer discount', price_percent: 20, amount: 500)
      @discount2 = Discount.create!(name: 'Holiday Special', category: 'Holiday', description: 'Holiday discount', price_percent: 15, amount: 300)
      @discount3 = Discount.create!(name: 'Clearance', category: 'Clearance', description: 'Clearance discount', price_percent: 50, amount: 1000)

      visit discounts_path
    end

    it 'page has content' do
      expect(page).to have_content('Discounts Index Page')
      expect(page).to have_content('All Discounts')
    end

    it 'page has discount links' do
      expect(page).to have_link(@discount1.name)
      expect(page).to have_link(@discount2.name)
      expect(page).to have_link(@discount3.name)
    end

    it 'page shows discount information' do
      expect(page).to have_content(@discount1.category)
      expect(page).to have_content('20%')
      expect(page).to have_content('$5.00')
    end

    it 'discount link goes to discount show page' do
      click_link(@discount1.name)
      expect(current_path).to eq(discount_path(@discount1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
