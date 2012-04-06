require 'spec_helper'

describe "contributors/index" do
  before(:each) do
    assign(:contributors, [
      stub_model(Contributor),
      stub_model(Contributor)
    ])
  end

  it "renders a list of contributors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
