require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_confirmation) }
  end

  describe 'associations' do  
    it { should have_many(:sale_invoices) }
    it { should have_many(:sales).through(:sale_invoices) }
    it { should have_many(:invoices).through(:sale_invoices) }
    it { should have_many(:invoice_items) }
    it { should have_many(:purchase_orders)}
  end
end
