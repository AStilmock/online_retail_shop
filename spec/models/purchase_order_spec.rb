require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:complete) }
  end

  describe 'associations' do  
    it { should have_many(:purchase_order_items) }
    it { should have_many(:items).through(:purchase_order_items) }
    it { should have_many(:product_categories).through(:items) }
    it { should belong_to(:vendor) }
    it { should belong_to(:user) }
  end
end