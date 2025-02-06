require 'rails_helper'

RSpec.describe 'Login Path', type: :feature do
  describe 'user can login' do
    before :each do
      @user = User.create!(email: 'testemail@email.com', password: 'password', password_confirmation: 'password')
      visit login_path
    end

    it 'user_sessions#new' do
    expect(page).to have_content('Login')
    expect(page).to have_link('Register')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_button('Login')
    end

    it 'user_sessions#create' do  
      fill_in 'email', with: @user.email
      fill_in 'password', with: "password"
      click_button 'Login'
      expect(current_path).to eq(root_path)
      expect(page).to have_link('Edit Profile')
      expect(page).to have_link('Logout')
    end
  end
end