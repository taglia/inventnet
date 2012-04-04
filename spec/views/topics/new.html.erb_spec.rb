require 'spec_helper'

describe "topics/new" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :title => "MyString",
      :abstract => "MyText",
      :owner => nil
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path, :method => "post" do
      assert_select "input#topic_title", :name => "topic[title]"
      assert_select "textarea#topic_abstract", :name => "topic[abstract]"
    end
  end
end
