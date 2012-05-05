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

describe ContributorsController do
  login_user

  describe "GET index" do
    it "assigns all contributors for a given topic as @contributors" do
      role = FactoryGirl.create(:role)
      get :index, topic_id: role.topic.id
      assigns(:contributors).should eq([role.user])
    end
  end

  describe "GET new" do
    it "assigns a new contributor as @contributor" do
      get :new
      assigns(:contributor).should be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contributor for the given topic" do
        topic = FactoryGirl.create(:topic)
        contributor = FactoryGirl.create(:user)
        expect {
          post :create, { topic_id: topic.id, user: { email: contributor.email } }
        }.to change(Role, :count).by(1)
      end

      it "assigns a newly created contributor as @contributor" do
        post :create, {:contributor => valid_attributes}, valid_session
        assigns(:contributor).should be_a(Contributor)
        assigns(:contributor).should be_persisted
      end

      it "redirects to the created contributor" do
        post :create, {:contributor => valid_attributes}, valid_session
        response.should redirect_to(Contributor.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contributor as @contributor" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contributor.any_instance.stub(:save).and_return(false)
        post :create, {:contributor => {}}, valid_session
        assigns(:contributor).should be_a_new(Contributor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contributor.any_instance.stub(:save).and_return(false)
        post :create, {:contributor => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contributor" do
      contributor = Contributor.create! valid_attributes
      expect {
        delete :destroy, {:id => contributor.to_param}, valid_session
      }.to change(Contributor, :count).by(-1)
    end

    it "redirects to the contributors list" do
      contributor = Contributor.create! valid_attributes
      delete :destroy, {:id => contributor.to_param}, valid_session
      response.should redirect_to(contributors_url)
    end
  end

end
