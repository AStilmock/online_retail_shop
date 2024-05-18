require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:phone)}
    it { should validate_presence_of(:category)}
  end

  describe 'associations' do  
    it { should belong_to(:user) }
  end
end