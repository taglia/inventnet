#FactoryGirl.define do

#  factory :user do
#    sequence(:email) { |n| "user-#{n}@test.com" }
#    password "TestPassword123"
#    password_confirmation "TestPassword123"
#  end

#  factory :topic do
#    title "Test Topic"
#    owner FactoryGirl.create(:user)
#  end

#  factory :role do
#    user FactoryGirl.create(:user)
#    topic FactoryGirl.create(:topic)
#  end

#end
