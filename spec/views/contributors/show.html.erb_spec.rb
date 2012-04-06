require 'spec_helper'

describe "contributors/show" do
  before(:each) do
    @contributor = assign(:contributor, stub_model(Contributor))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
