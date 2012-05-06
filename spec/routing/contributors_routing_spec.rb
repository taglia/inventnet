require "spec_helper"

describe ContributorsController do
  describe "routing" do
    it "routes to #index" do
      get("topics/1/contributors").should route_to("contributors#index", topic_id: "1")
    end

    it "routes to #new" do
      get("topics/1/contributors/new").should route_to("contributors#new", topic_id: "1")
    end

    it "routes to #create" do
      post("topics/1/contributors").should route_to("contributors#create", topic_id: "1")
    end

    it "routes to #destroy" do
      delete("topics/1/contributors/1").should route_to("contributors#destroy", :id => "1", topic_id: "1")
    end

  end
end
