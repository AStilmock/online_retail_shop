require 'rails_helper'

RSpec.describe Vendor, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end

  describe 'associations' do  
    it { should have_many(:items) }
    it { should have_many(:product_categories).through(:items) }
    it { should have_many(:purchase_orders) }
  end
end