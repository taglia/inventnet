require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe IdeasController do

  # This should return the minimal set of attributes required to create a valid
  # Idea. As you add validations to Idea, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.confirm!
    sign_in @user
  end

  after(:each) do
    sign_out @user
  end

  describe "GET index" do
    it "assigns all ideas as @ideas" do
      idea = Idea.create! valid_attributes
      get :index, {}
      assigns(:ideas).should eq([idea])
    end
  end

  describe "GET show" do
    it "assigns the requested idea as @idea" do
      idea = Idea.create! valid_attributes
      get :show, {:id => idea.to_param}
      assigns(:idea).should eq(idea)
    end
  end

  describe "GET new" do
    it "assigns a new idea as @idea" do
      get :new, {}
      assigns(:idea).should be_a_new(Idea)
    end
  end

  describe "GET edit" do
    it "assigns the requested idea as @idea" do
      idea = Idea.create! valid_attributes
      get :edit, {:id => idea.to_param}
      assigns(:idea).should eq(idea)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Idea" do
        expect {
          post :create, {:idea => valid_attributes}
        }.to change(Idea, :count).by(1)
      end

      it "assigns a newly created idea as @idea" do
        post :create, {:idea => valid_attributes}
        assigns(:idea).should be_a(Idea)
        assigns(:idea).should be_persisted
      end

      it "redirects to the created idea" do
        post :create, {:idea => valid_attributes}
        response.should redirect_to(Idea.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved idea as @idea" do
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        post :create, {:idea => {}}
        assigns(:idea).should be_a_new(Idea)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        post :create, {:idea => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested idea" do
        idea = Idea.create! valid_attributes
        # Assuming there are no other ideas in the database, this
        # specifies that the Idea created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Idea.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => idea.to_param, :idea => {'these' => 'params'}}
      end

      it "assigns the requested idea as @idea" do
        idea = Idea.create! valid_attributes
        put :update, {:id => idea.to_param, :idea => valid_attributes}
        assigns(:idea).should eq(idea)
      end

      it "redirects to the idea" do
        idea = Idea.create! valid_attributes
        put :update, {:id => idea.to_param, :idea => valid_attributes}
        response.should redirect_to(idea)
      end
    end

    describe "with invalid params" do
      it "assigns the idea as @idea" do
        idea = Idea.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        put :update, {:id => idea.to_param, :idea => {}}
        assigns(:idea).should eq(idea)
      end

      it "re-renders the 'edit' template" do
        idea = Idea.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        put :update, {:id => idea.to_param, :idea => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested idea" do
      idea = Idea.create! valid_attributes
      expect {
        delete :destroy, {:id => idea.to_param}
      }.to change(Idea, :count).by(-1)
    end

    it "redirects to the ideas list" do
      idea = Idea.create! valid_attributes
      delete :destroy, {:id => idea.to_param}
      response.should redirect_to(ideas_url)
    end
  end

end
