require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:sub_total_sale_price) }
    it { should validate_presence_of(:shipping) }
    it { should validate_presence_of(:taxes) }
    it { should validate_presence_of(:total_sale_price) }
    it { should validate_presence_of(:complete) }
  end

  describe 'associations' do  
    it { should have_many(:sale_invoices) }
    it { should have_many(:sales).through(:sale_invoices) }
    it { should have_many(:invoices).through(:sale_invoices) }
    it { should have_many(:users).through(:sale_invoices) }
    it { should have_many(:discounts).through(:sale_invoices) }
  end
end