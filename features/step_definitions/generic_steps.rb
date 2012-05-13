Then /^I am taken to the root page$/ do
  assert(current_url.ends_with?("/"))
end
