require "spec_helper"

describe Notifier do
  describe "multipart_alternative_rich" do
    let(:user) { FactoryGirl.create(:user) }
    let(:topic) { FactoryGirl.create(:topic) }
    let(:idea) { FactoryGirl.create(:idea) }
    let(:mail) { Notifier.new_idea(user.email, topic, idea) }

    it "renders the headers" do
      mail.subject.should eq("InventNet - New idea posted in '#{topic.title}'")
      mail.to.should eq([user.email])
      mail.from.should eq(["DoNotReply@inventnet.me"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Dear")
    end
  end

end
