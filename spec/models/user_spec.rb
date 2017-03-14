require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe 'creation' do
    it 'can be created' do      
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name model method' do
    it 'has a full name combines first_name and last_name' do
      expect(@user.full_name).to eq("John Snow")
    end
  end
end
