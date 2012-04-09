class TopicsController < ApplicationController
  before_filter :authenticate_user!

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.user_authorized?(current_user)
        format.html # show.html.erb
        format.json { render json: @topic }
      else
        flash[:alert] = "You are not authorized to see this topic!"
        format.html { redirect_to root_path }
      end
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
    if !@topic.user_authorized?(current_user)
      flash[:alert] = "You are not authorized to edit this topic!"
      redirect_to root_path
    end
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])

    # Make sure the new topic belongs to the current user
    @topic.owner = current_user

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    # Check if the current user is the owner
    if @topic.owner != current_user then
      sign_out current_user
      flash[:alert] = "You can't modify a topic which does not belong to you!"
      redirect_to new_user_session_path
      return
    end

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])

    # Check if the current user is the owner
    if @topic.owner != current_user then
      sign_out current_user
      flash[:alert] = "You can't delete a topic which does not belong to you!"
      redirect_to new_user_session_path
      return
    end

    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
end
