require 'rails_helper'

RSpec.describe 'Employees Index Page', type: :feature do
  describe 'GET /employees' do
    before :each do
      @user1 = User.create!(email: 'employee1@example.com', password: 'password123', password_confirmation: 'password123')
      @user2 = User.create!(email: 'employee2@example.com', password: 'password123', password_confirmation: 'password123')
      
      @employee1 = Employee.create!(
        first_name: 'John',
        last_name: 'Doe',
        address: '123 Main St',
        email: 'john@example.com',
        phone: '555-1234',
        category: 1,
        user_id: @user1.id
      )
      
      @employee2 = Employee.create!(
        first_name: 'Jane',
        last_name: 'Smith',
        address: '456 Oak Ave',
        email: 'jane@example.com',
        phone: '555-5678',
        category: 2,
        user_id: @user2.id
      )

      visit employees_path
    end

    it 'page has content' do
      expect(page).to have_content('Employees Index Page')
      expect(page).to have_content('All Employees')
    end

    it 'page has employee links' do
      expect(page).to have_link("#{@employee1.first_name} #{@employee1.last_name}")
      expect(page).to have_link("#{@employee2.first_name} #{@employee2.last_name}")
    end

    it 'page shows employee information' do
      expect(page).to have_content(@employee1.email)
      expect(page).to have_content(@employee2.email)
      expect(page).to have_content(@employee1.category)
      expect(page).to have_content(@employee2.category)
    end

    it 'employee link goes to employee show page' do
      click_link("#{@employee1.first_name} #{@employee1.last_name}")
      expect(current_path).to eq(employee_path(@employee1.id))
    end

    it 'has home link' do
      expect(page).to have_link('Home')
    end
  end
end
