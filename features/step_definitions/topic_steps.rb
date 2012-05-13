Given /^a topic named "([^"]*)" owned by "([^"]*)"$/ do |topic_title, owner|
    @topic = Topic.new(title: topic_title)
    @topic.owner = User.where(email: owner).first
    @topic.save!
end

Given /^"([^"]*)" is a contributor for "([^"]*)"$/ do |user_email, topic_title|
    topic = Topic.where(title: topic_title).first
    user = User.where(email: user_email).first

    topic.users << user
    topic.save!
end

When /^I visit the topic page for "([^"]*)"$/ do |topic_title|
    topic = Topic.where(title: topic_title).first
    visit "/topics/#{topic.id}"
end

Then /^I am taken to the topic page for "([^"]*)"$/ do |topic_title|
    topic = Topic.where(title: topic_title).first
    assert(current_url.ends_with?("topics/#{topic.id}"))
end
