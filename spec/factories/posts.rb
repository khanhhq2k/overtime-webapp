FactoryGirl.define do

  factory :post do
    date Date.today
    rationale "Sample data"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Sample data 2"
    user
  end

end