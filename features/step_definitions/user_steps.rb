Given /^the following users$/ do |user_data|
  User.create!(user_data.hashes)
end
