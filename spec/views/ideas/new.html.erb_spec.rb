require 'spec_helper'

describe "ideas/new" do
  before(:each) do
    assign(:idea, stub_model(Idea,
      :title => "MyString",
      :content => "MyText",
      :topic => nil
    ).as_new_record)
  end

  it "renders new idea form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ideas_path, :method => "post" do
      assert_select "input#idea_title", :name => "idea[title]"
      assert_select "textarea#idea_content", :name => "idea[content]"
    end
  end
end
