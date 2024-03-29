require 'spec_helper'

describe TopicsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.confirm!
    sign_in @user
  end

  after(:each) do
    sign_out @user
  end

  describe "GET index" do
    it "assigns all topics as @topics" do
      topic = create(:topic, owner: @user)
      get :index, {}
      assigns(:topics).should eq([topic])
    end
  end

  describe "GET show" do
    it "assigns the requested topic as @topic" do
      topic = create(:topic, owner: @user)
      get :show, {:id => topic.id}
      assigns(:topic).should eq(topic)
    end
  end

  describe "GET new" do
    it "assigns a new topic as @topic" do
      get :new, {}
      assigns(:topic).should be_a_new(Topic)
    end
  end

  describe "GET edit" do
    it "assigns the requested topic as @topic" do
      topic = create(:topic, owner: @user)
      get :edit, {:id => topic.id}
      assigns(:topic).should eq(topic)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Topic" do
        expect {
          post :create, {:topic => attributes_for(:topic)}
        }.to change(Topic, :count).by(1)
      end

      it "belongs to the current user" do
        post :create, {topic: attributes_for(:topic)}
        assigns(:topic).owner.should eq(@user)
      end

      it "assigns a newly created topic as @topic" do
        post :create, {:topic => attributes_for(:topic)}
        assigns(:topic).should be_a(Topic)
        assigns(:topic).should be_persisted
      end

      it "redirects to the created topic" do
        post :create, {:topic => attributes_for(:topic)}
        response.should redirect_to(Topic.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved topic as @topic" do
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        post :create, {:topic => {}}
        assigns(:topic).should be_a_new(Topic)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        post :create, {:topic => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before(:each) do
        @topic = FactoryGirl.create(:topic)
        controller.stub current_user: @topic.owner
      end

      it "updates the requested topic" do
        Topic.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @topic.id, :topic => {'these' => 'params'}}
      end

      it "assigns the requested topic as @topic" do
        put :update, {:id => @topic.id, :topic => attributes_for(:topic)}
        assigns(:topic).should eq(@topic)
      end

      it "redirects to the topic" do
        put :update, {:id => @topic.id, :topic => attributes_for(:topic)}
        response.should redirect_to(@topic)
      end
    end

    describe "with invalid params" do
      it "assigns the topic as @topic" do
        topic = create(:topic, owner: @user)
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        put :update, {:id => topic.id, :topic => {}}
        assigns(:topic).should eq(topic)
      end

      it "re-renders the 'edit' template" do
        topic = create(:topic, owner: @user)
        # Trigger the behavior that occurs when invalid params are submitted
        Topic.any_instance.stub(:save).and_return(false)
        put :update, {:id => topic.id, :topic => {}}
        response.should render_template("edit")
      end

      it "should not update other a topic belonging to another user" do
        topic = create(:topic, owner: @user)
        sign_out @user
        other_user = create(:user)
        other_user.confirm!
        sign_in other_user

        updated_topic = attributes_for(:topic, title: "A bad idea")

        put :update, {id: topic.id, topic: updated_topic}

        Topic.find(topic.id).title.should_not eq("A bad idea")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested topic" do
      topic = create(:topic, owner: @user)
      expect {
        delete :destroy, {:id => topic.id}
      }.to change(Topic, :count).by(-1)
    end

    it "redirects to the topics list" do
      topic = create(:topic, owner: @user)
      delete :destroy, {:id => topic.id}
      response.should redirect_to(topics_url)
    end

    it "does not delete other people's topics" do
      topic = create(:topic, owner: @user)
      sign_out @user
      other_user = create(:user)
      other_user.confirm!
      sign_in other_user

      delete :destroy, {:id => topic.id}

      expect { Topic.find(topic.id) }.should_not raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
