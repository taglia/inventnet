FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test_user_#{n}@test_domain.com" }
    confirmed_at "2012-01-01 00:00 UTC"
    password "password"
  end
end