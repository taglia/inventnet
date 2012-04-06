require "spec_helper"

describe Notifier do
  describe "multipart_alternative_rich" do
    let(:mail) { Notifier.new_idea }

    it "renders the headers" do
      mail.subject.should eq("Multipart alternative rich")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
