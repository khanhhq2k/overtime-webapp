require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do
      user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post, user_id: user.id)
    end
    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without date, rationale, overtime_request' do
      @post.date = nil
      @post.rationale = nil
      @post.overtime_request = nil
      expect(@post).to_not be_valid
    end

    it 'must have a time request greater than 0.0' do
      @post.overtime_request = 0.0
      expect(@post).to_not be_valid
    end
  end

end
