require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
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
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)

      visit posts_path
      expect(page).to have_content(/Sample|data/)
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

  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end
    it 'can be reached by clicking edit button on index page' do
      @post = FactoryGirl.create(:post)
      visit posts_path

      click_link "edit_post_#{@post.id}"
      expect(page.status_code).to eq(200)

    end

    it 'can be edited' do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_button "submit_post"

    end
  end
end