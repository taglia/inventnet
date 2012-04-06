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
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @topic = Topic.find(params[:topic_id])
    @idea = Idea.find(params[:id])
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
      if @idea.save
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
