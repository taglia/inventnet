Then /^I am taken to the root page$/ do
  assert(current_url.ends_with?("/"))
end

When /^I follow the link "([^"]*)"$/ do |link|
    click_link link
end

When /^I click on "([^"]*)"$/ do |clickable|
    page.find(:css, "a.btn", content: clickable).click
end

When /^I fill "([^"]*)" with "([^"]*)"$/ do |field_name, content|
    fill_in field_name, with: content
end

Then /^I see "([^"]*)"$/ do |text|
    page.should have_content text
end
