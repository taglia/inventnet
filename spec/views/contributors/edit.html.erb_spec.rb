require 'spec_helper'

describe "contributors/edit" do
  before(:each) do
    @contributor = assign(:contributor, stub_model(Contributor))
  end

  it "renders the edit contributor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contributors_path(@contributor), :method => "post" do
    end
  end
end
