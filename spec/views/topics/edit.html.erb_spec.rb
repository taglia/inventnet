require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "MyString",
      :abstract => "MyText",
      :owner => nil
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path(@topic), :method => "post" do
      assert_select "input#topic_title", :name => "topic[title]"
      assert_select "textarea#topic_abstract", :name => "topic[abstract]"
      assert_select "input#topic_owner", :name => "topic[owner]"
    end
  end
end
