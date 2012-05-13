Given /^a topic named "([^"]*)" owned by "([^"]*)"$/ do |topic_title, owner|
    @topic = Topic.create!(title: topic_title, owner:User.where(email: owner))
end
