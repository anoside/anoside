FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}" }
    password 'password'
    accept_language_id 1
  end

  factory :post do
    sequence(:title) { |n| "title-#{n}" }
    sequence(:body) { |n| "body-#{n}" }
  end

  factory :language do
    code 'en'
  end
end
