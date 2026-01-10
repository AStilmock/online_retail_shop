require 'rails_helper'

RSpec.describe 'Sales Index Page', type: :feature do
  describe 'GET /sales' do
    before :each do
      @sale1 = Sale.create!(date_time: Time.now, sub_total_sale_price: 2500, shipping: 500, taxes: 200, total_sale_price: 3200, complete: false)
      @sale2 = Sale.create!(date_time: Time.now, sub_total_sale_price: 5000, shipping: 1000, taxes: 400, total_sale_price: 6400, complete: true)
      @sale3 = Sale.create!(date_time: Time.now, sub_total_sale_price: 7500, shipping: 1500, taxes: 600, total_sale_price: 9600, complete: false)

      visit sales_path
    end

    it 'page has content' do
      expect(page).to have_content('Sales Index Page')
      expect(page).to have_content('All Sales')
    end

    it 'page has sale links' do
      expect(page).to have_link("Sale ##{@sale1.id}")
      expect(page).to have_link("Sale ##{@sale2.id}")
      expect(page).to have_link("Sale ##{@sale3.id}")
    end

    it 'page shows sale information' do
      expect(page).to have_content('$25.00')
      expect(page).to have_content('$50.00')
      expect(page).to have_content('$75.00')
      expect(page).to have_content('$32.00')
      expect(page).to have_content('$64.00')
      expect(page).to have_content('$96.00')
      expect(page).to have_content('Complete')
      expect(page).to have_content('Pending')
    end

    it 'sale link goes to sale show page' do
      click_link("Sale ##{@sale1.id}")
      expect(current_path).to eq(sale_path(@sale1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
