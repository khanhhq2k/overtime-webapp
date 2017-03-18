require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) { FactoryGirl.create(:post, user_id: user.id) }

  before do
    login_as(user, scope: :user)
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
      FactoryGirl.create(:post, user_id: user.id)
      visit posts_path
      expect(page).to have_content(/Sample/)
    end

    it 'has a scope that only post creators can see their posts' do
      other_user = FactoryGirl.create(:other_user)
      post_of_other_user = Post.create(date: Date.today, rationale: 'this should not be seen', user_id: other_user.id)
      visit posts_path

      expect(page).to_not  have_content(/this should not be seen/)
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
      fill_in 'post[rationale]', with: 'my rationale'

      click_on 'Save'

      expect(page).to have_content('my rationale')
    end

    it 'will have a user associated with' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'

      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end

  end

  describe 'new' do
    it 'has a link from homepage' do
      visit root_path
      click_link 'new_post_btn'
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)
      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)
      post_to_delete = Post.create(date: Date.today, rationale: 'asdf', user_id: delete_user.id)
      visit posts_path
      click_link "delete_post_#{post_to_delete.id}"

      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    it 'can be reached by clicking edit button on index page' do
      logout(:user)
      edit_user = FactoryGirl.create(:user)
      login_as(edit_user, :scope => :user)
      post_to_edit = Post.create(date: Date.today, rationale: 'asdf', user_id: edit_user.id)

      visit posts_path
      click_link "edit_post_#{post_to_edit.id}"
      expect(page.status_code).to eq(200)

    end

    it 'can be edited' do
      visit edit_post_path(post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_button 'submit_post'

      expect(page).to have_content('Edited content')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)
      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end
end
