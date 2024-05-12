require 'rails_helper'

RSpec.describe 'Logout Path', type: :feature do
  describe 'user can logout' do
    before :each do
      @user = User.create!(email: 'testemail@email.com', password: 'password', password_confirmation: 'password')
      visit login_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: "password"
    end

    it 'user_session#destroy' do
    click_button 'Login'
    expect(current_path).to eq(root_path)
    # expect(page).to have_content('Login successful')
    expect(page).to have_link('Logout')
    click_link 'Logout'
    expect(current_path).to eq(root_path)
    # expect(page).to have_content('Logged out!')
    expect(page).to have_link('Login')
    end
  end
end