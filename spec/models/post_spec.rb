require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do
      # a little hack to bypass belongs_to :user, optional: true(default)
      user = User.create(email: "test@abc.com", password: "asdasd", password_confirmation: "asdasd", first_name: "John", last_name: "Snow")

      @post = Post.create(date: Date.today, rationale: "Anythingg!!", user_id: user.id)
    end
    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without date and rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
  
end
