require 'rails_helper'

describe 'admin dashboard' do
  it 'can be reached successfully' do ##Dumb
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'does not allow users to reach without signing in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end


  it 'cannot be reached by a non admin user' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit admin_root_path

    expect(current_path).to eq(root_path)
  end

  it 'can be reach by an admin user' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end
end
