require 'spec_helper'

describe "contributors/new" do
  before(:each) do
    assign(:contributor, stub_model(Contributor).as_new_record)
  end

  it "renders new contributor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contributors_path, :method => "post" do
    end
  end
end
