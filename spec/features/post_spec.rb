require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test@abc.com", password: "asdasd", password_confirmation: "asdasd", first_name: "John", last_name: "Snow")
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationale: "post1!", user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "post2!", user_id: @user.id)

      visit posts_path
      expect(page).to have_content(/post1!|post2!/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new page' do

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "my rationale"

      click_on "Save"

      expect(page).to have_content("my rationale")
    end

    it 'will have a user associated with' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end

  end
end