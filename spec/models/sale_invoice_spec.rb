require 'rails_helper'

RSpec.describe SaleInvoice, type: :model do
  describe 'validations' do 
    
  end

  describe 'associations' do  
    it { should belong_to(:sale) }
    it { should belong_to(:invoice) }
    it { should belong_to(:user) }
    it { should belong_to(:discount) }
  end
end