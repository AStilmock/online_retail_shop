require 'rails_helper'

RSpec.describe 'User Registration Process', type: :feature do
  describe 'user can create account' do
    before :each do
      visit new_user_path
    end
    it 'user#new' do
      expect(page).to have_content('Create an Account')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_field('Password confirmation')
      expect(page).to have_button('Create Account')
    end

    it 'user#create' do
      fill_in 'email', with: 'testemail@email.com'
      fill_in 'password', with: 'testpassword'
      fill_in 'password_confirmation', with: 'testpassword'
      click_button 'Create Account'
      expect(current_path).to eq(root_path)
      expect(page).to_not have_link('Login')
    end
    
    it 'user stays logged in when profile is created' do 
      fill_in 'email', with: 'testemail@email.com'
      fill_in 'password', with: 'testpassword'
      fill_in 'password_confirmation', with: 'testpassword'
      click_button 'Create Account'
      expect(current_path).to eq(root_path)
      expect(page).to have_link('Logout')
      expect(page).to have_link('Edit Profile')
    end
  end
end