FactoryGirl.define do

  factory :post do
    date Date.today
    rationale "Sample data"
    user_id User.first.id
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Sample data 2"
    user_id User.first.id
  end

end