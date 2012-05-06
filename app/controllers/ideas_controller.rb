class IdeasController < ApplicationController
  before_filter :authenticate_user!

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @topic.user_authorized?(current_user)
        format.html # show.html.erb
        format.json { render json: @idea }
      else
        flash[:alert] = "You are not authorized to see this topic!"
        format.html { redirect_to root_path }
      end
    end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.find(params[:id])

    if !@topic.user_authorized?(current_user)
      flash[:alert] = "You are not authorized to edit ideas in this topic!"
      redirect_to root_path
      return
    end

    if @topic.owner != current_user && @idea.user != current_user
      flash[:alert] = "You are not authorized to edit this idea!"
      redirect_to root_path
    end
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.new(params[:idea])

    # Make sure the new idea belongs to the current user
    @idea.user = current_user
    @idea.topic = @topic

    respond_to do |format|
      if @idea.save then
        # Send notifications
        recipients = @topic.users + [@topic.owner]
        recipients.each do |r|
          Notifier.new_idea(r.email, @topic, @idea).deliver
        end
        format.html { redirect_to @topic, notice: 'Idea was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @topic, notice: 'Idea was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to @topic, notice: 'Idea was successfully deleted.' }
    end
  end
end
