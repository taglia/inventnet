FactoryGirl.define do

  factory :user, aliases: [:owner, :contributor] do
    sequence(:email) { |n| "test_user_#{n}@test_domain.com" }
    confirmed_at "2012-01-01 00:00 UTC"
    password "password"
  end

  factory :topic do
    title "Idea Box"
    abstract "Uno scatolone di ideone"
    owner
  end

  factory :idea do
    title "Buona idea"
    content "La migliore idea mai venuta!"
    user
  end

  factory :role do
    user
    topic
  end

end
