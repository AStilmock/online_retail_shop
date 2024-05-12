require 'rails_helper'

RSpec.describe 'Application Landing Page' do
  describe 'home page' do
    before :each do
      visit root_path
    end

    it 'succesful connection' do
      expect(page.status_code).to eq(200)
    end

    it 'user#index' do
      expect(page).to have_content('WELCOME TO THE TEST ONLINE RETAIL STORE!')
      expect(page).to have_content('All sales are final.')
      expect(page).to have_content('And all merchandise is fake.')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end
  end
end