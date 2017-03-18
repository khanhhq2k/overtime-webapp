require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post, user_id: user.id)
    end

    it 'has a status that can be edited by an Admin User' do
      visit edit_post_path(@post)

      choose 'post_status_approved'
      click_on "Update"

      expect(@post.reload.status).to eq('approved')
    end

    it 'cannot be edited by an NON Admin User' do
      logout(:user)
      user = FactoryGirl.create(:non_authorized_user)
      login_as(user, scope: :user)
      visit edit_post_path(@post)

      expect(page).to_not have_content('Approved')
    end

    it 'should not be editable by the post creator if status is approved' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

      @post.update(user_id: user.id, status: 'approved')

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end
end