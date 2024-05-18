require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
  end

  describe 'associations' do  
    it { should have_many(:items) }
    it { should have_many(:vendors).through(:items) }
  end
end