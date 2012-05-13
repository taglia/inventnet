Given /^the following users$/ do |user_data|
  User.create!(user_data.hashes)
  user_data.hashes.each do |e|
    user = User.where(email: e["email"]).first
    user.confirmed_at = user.created_at
    user.save!
  end
end

Given /^"([^"]*)" is logged in using password "([^"]*)"$/ do |user_email, password|
  visit '/users/sign_in'
  fill_in "Email", with: user_email
  fill_in "Password", with: password
  click_button "Sign in"
end

