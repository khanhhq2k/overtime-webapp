FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
  factory :user do
    email {generate :email}
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'John'
    last_name 'Snow'
  end

  factory :other_user, class: 'User' do
    email {generate :email}
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'John'
    last_name 'Snow'
  end

  factory :admin_user, class: 'AdminUser' do
    email {generate :email}
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'Admin'
    last_name 'User'
  end

  factory :non_authorized_user, class: 'User' do
    email {generate :email}
    password 'asdasd'
    password_confirmation 'asdasd'
    first_name 'Non Authorized Person'
    last_name 'Snow'
  end
end