require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:description) } 
    it { should validate_presence_of(:price_percent) }
    it { should validate_presence_of(:amount) } 
  end

  describe 'associations' do  
  it { should have_many(:invoice_items) }
  it { should have_many(:items).through(:invoice_items)}
  it { should have_many(:users).through(:invoice_items)}
  it { should have_many(:invoices).through(:invoice_items)}
  it { should have_many(:sale_invoices) }
  it { should have_many(:sales).through(:sale_invoices) }
  end
end