FactoryGirl.define do

  factory :post do
    date Date.today
    rationale "Sample data"
    overtime_request 3.5
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Sample data 2"
    overtime_request 1.5
  end

end