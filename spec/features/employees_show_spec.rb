require 'rails_helper'

RSpec.describe 'Employee Show Page', type: :feature do
  describe 'GET /employees/:id' do
    before :each do
      @user = User.create!(email: 'employee@example.com', password: 'password123', password_confirmation: 'password123')
      
      @employee = Employee.create!(
        first_name: 'John',
        last_name: 'Doe',
        address: '123 Main St',
        email: 'john@example.com',
        phone: '555-1234',
        category: 1,
        user_id: @user.id
      )
    end

    it 'page has content' do
      visit employee_path(@employee.id)
      expect(page).to have_content('Employee Show Page')
      expect(page).to have_content(@employee.first_name)
      expect(page).to have_content(@employee.last_name)
    end

    it 'page shows employee details' do
      visit employee_path(@employee.id)
      expect(page).to have_content(@employee.email)
      expect(page).to have_content(@employee.address)
      expect(page).to have_content(@employee.phone)
      expect(page).to have_content(@employee.category)
    end

    it 'page shows user account link' do
      visit employee_path(@employee.id)
      expect(page).to have_link(@employee.user.email)
    end

    it 'has back to employees link' do
      visit employee_path(@employee.id)
      expect(page).to have_link('Back to Employees')
    end

    it 'has home link' do
      visit employee_path(@employee.id)
      expect(page).to have_link('Home')
    end
  end
end
