require 'rails_helper'

RSpec.describe PurchaseOrderItem, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:quantity) }
  end

  describe 'associations' do  
    it { should belong_to(:item) }
    it { should belong_to(:purchase_order) }
  end
end