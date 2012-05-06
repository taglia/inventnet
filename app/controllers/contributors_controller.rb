class ContributorsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @topic = Topic.find(params[:topic_id])
    @contributors = @topic.users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contributors }
    end
  end

  def new
    @contributor = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contributor }
    end
  end

  def create
    @contributor = params[:user][:email]
    @topic = Topic.find params[:topic_id]

    respond_to do |format|
      if User.where("email='#{@contributor}'").count == 1
        user = User.where("email='#{@contributor}'").first
        if @topic.users.include? user then
          format.html { redirect_to topic_contributors_path, alert: "User #{@contributor} is already a contributor!" }
        elsif @topic.owner == user
          format.html { redirect_to topic_contributors_path, alert: "User #{@contributor} is the owner of this topic!" }
        else
          @topic.users << user
          format.html { redirect_to topic_contributors_path, notice: "Contributor #{@contributor} was successfully added." }
        end
      else
        flash[:alert] = "There are no users with email #{@contributor}. Ask them to register!"
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    topic = Topic.find(params[:topic_id])
    user = topic.users.find(params[:id])
    role = Role.where("user_id = ? AND topic_id = ?", user.id, topic.id)[0]

    role.destroy

    respond_to do |format|
      flash[:notice] = "Contributor successfully removed."
      format.html { redirect_to topic_contributors_url }
      format.json { head :no_content }
    end
  end
end
