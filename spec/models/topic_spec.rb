require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:owner) }

  describe "authorized users validation" do
    let(:mock_owner) { double(User) }
    let(:topic) { Topic.new }

    before(:each) do
      topic.stub(:owner).and_return(mock_owner)
    end

    it "should allow access to the topic owner" do
      topic.user_authorized?(mock_owner).should be_true
    end

    it "should allow access to contributors" do
      mock_contributor = double(User)
      topic.stub(:users).and_return([mock_contributor])
      topic.user_authorized?(mock_contributor).should be_true
    end

    it "should deny access to other users" do
      mock_user = double(User)
      topic.user_authorized?(mock_user).should be_false
    end
  end

  it "should find topic where the user is owner or contributor" do
    role = mock_model(Role)
    user = mock_model(User)
    other_user = mock_model(User)
    topic_1 = Topic.new(title: "Topic 1")
    topic_1.owner = user
    topic_2 = Topic.new(title: "Topic 2")
    topic_2.owner = other_user

    topic_1.save!
    topic_2.save!

    role.stub(:user).and_return(user)
    role.stub(:topic).and_return(topic_2)
    role.stub(:topic_id).and_return(topic_2.id)
    Role.stub(:where).and_return([role])

    Topic.find_by_authorized_user(user).should eql([topic_1, topic_2])
  end

end
