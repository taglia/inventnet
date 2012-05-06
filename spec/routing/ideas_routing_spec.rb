require "spec_helper"

describe IdeasController do
  describe "routing" do

    it "routes to #new" do
      get("/topics/1/ideas/new").should route_to("ideas#new", topic_id: "1")
    end

    it "routes to #show" do
      get("/topics/1/ideas/1").should route_to("ideas#show", :id => "1", topic_id: "1")
    end

    it "routes to #edit" do
      get("/topics/1/ideas/1/edit").should route_to("ideas#edit", :id => "1", topic_id: "1")
    end

    it "routes to #create" do
      post("/topics/1/ideas").should route_to("ideas#create", topic_id: "1")
    end

    it "routes to #update" do
      put("/topics/1/ideas/1").should route_to("ideas#update", :id => "1", topic_id: "1")
    end

    it "routes to #destroy" do
      delete("/topics/1/ideas/1").should route_to("ideas#destroy", :id => "1", topic_id: "1")
    end

  end
end
