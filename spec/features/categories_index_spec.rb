require 'rails_helper'

RSpec.describe 'Product Categories Index Page', type: :feature do
  describe 'GET /categories' do
    before :each do
      @category1 = ProductCategory.create!(name: 'Shirts', description: 'T-shirts')
      @category2 = ProductCategory.create!(name: 'Hoodies', description: 'Hoodies')
      @category3 = ProductCategory.create!(name: 'Hats', description: 'Hats')
      @category4 = ProductCategory.create!(name: 'Stickers', description: 'Stickers')

      visit categories_path
    end

    it 'page has content' do
      expect(page).to have_content('Product Categories Index Page')
      expect(page).to have_content('All Product Categories')
    end

    it 'page has category links' do
      expect(page).to have_link(@category1.name)
      expect(page).to have_link(@category2.name)
      expect(page).to have_link(@category3.name)
      expect(page).to have_link(@category4.name)
    end

    it 'page shows category descriptions' do
      expect(page).to have_content(@category1.description)
      expect(page).to have_content(@category2.description)
      expect(page).to have_content(@category3.description)
      expect(page).to have_content(@category4.description)
    end

    it 'category link goes to category show page' do
      click_link(@category1.name)
      expect(current_path).to eq(category_path(@category1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end

    it 'has shopping link' do
      expect(page).to have_link('Shopping')
    end
  end
end
