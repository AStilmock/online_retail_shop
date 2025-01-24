require 'rails_helper'

RSpec.describe 'Application Landing Page' do
  describe 'home page' do
    before :each do
      visit root_path
    end

    it 'succesful connection' do
      expect(page.status_code).to eq(200)
    end

    it 'user#index text' do
      expect(page).to have_content('WELCOME TO THE TEST ONLINE RETAIL STORE!')
      expect(page).to have_content('All sales are final.')
      expect(page).to have_content('And all merchandise is fake.')
    end

    it 'users#index login link' do
      expect(page).to have_link('Login')
      click_link('Login')
      expect(current_path).to eq(login_path)
    end

    it 'users#index register link' do
      expect(page).to have_link('Register')
      click_link('Register')
      expect(current_path).to eq(new_user_path)
    end

    it 'users#index shopping page link' do
      expect(page).to have_link('Shopping Page')
      click_link('Shopping Page')
      expect(current_path).to eq(shopping_path)
    end
  end
end