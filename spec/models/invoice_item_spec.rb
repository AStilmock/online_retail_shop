require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:quantity) }
  end

  describe 'associations' do  
    it { should belong_to(:invoice) }
    it { should belong_to(:user) }
    it { should belong_to(:item) }
    it { should belong_to(:discount) }
  end
end