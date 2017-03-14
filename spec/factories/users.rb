FactoryGirl.define do
  factory :user do
    email "test@abc.com"
    password "asdasd"
    password_confirmation "asdasd"
    first_name "John"
    last_name "Snow"
  end

  factory :admin_user, class: "AdminUser" do
    email "admin@user.com"
    password "asdasd"
    password_confirmation "asdasd"
    first_name "Admin"
    last_name "User"
  end

end