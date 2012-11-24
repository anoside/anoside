FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}" }
    password 'password'
    guest false
  end

  factory :post do
    sequence(:title) { |n| "title-#{n}" }
    sequence(:body) { |n| "body-#{n}" }
  end
end
