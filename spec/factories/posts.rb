FactoryGirl.define do

  factory :post do
    date Date.today
    rationale "Sample data"
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Sample data 2"
  end

end