require 'rails_helper'

RSpec.describe 'User Registration Process', type: :feature do
  describe 'user can create account' do
    before :each do
      visit new_user_path
    end
    it 'user#new' do
      # visit new_user_path
      expect(page).to have_content('Create an Account')
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_field('password_confirmation')
    end

    it 'user#create' do
      visit new_user_path
      fill_in 'email', with: 'testemail@email.com'
      fill_in 'password', with: 'testpassword'
      fill_in 'password_confirmation', with: 'testpassword'
      click_button 'Create Account'
      expect(current_path).to eq(users_path)
    end
  end
end