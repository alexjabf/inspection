class SchedulesHistoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource


  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules_histories }

    end
  end

  # GET /schedules_histories/1
  # GET /schedules_histories/1.json
  def show
    @schedules_history = SchedulesHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedules_history }
    end
  end

  # GET /schedules_histories/new
  # GET /schedules_histories/new.json
  def new
    @schedules_history = SchedulesHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedules_history }
    end
  end

  # GET /schedules_histories/1/edit
  def edit
    @schedules_history = SchedulesHistory.find(params[:id])
  end

  # POST /schedules_histories
  # POST /schedules_histories.json
  def create
    @schedules_history = SchedulesHistory.new(params[:schedules_history])

    respond_to do |format|
      if @schedules_history.save
        format.html { redirect_to @schedules_history, notice: 'Schedules history was successfully created.' }
        format.json { render json: @schedules_history, status: :created, location: @schedules_history }
      else
        format.html { render action: "new" }
        format.json { render json: @schedules_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules_histories/1
  # PUT /schedules_histories/1.json
  def update
    @schedules_history = SchedulesHistory.find(params[:id])

    respond_to do |format|
      if @schedules_history.update_attributes(params[:schedules_history])
        format.html { redirect_to @schedules_history, notice: 'Schedules history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedules_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules_histories/1
  # DELETE /schedules_histories/1.json
  def destroy
    @schedules_history = SchedulesHistory.find(params[:id])
    @schedules_history.destroy

    respond_to do |format|
      format.html { redirect_to schedules_histories_url }
      format.json { head :no_content }
    end
  end
  
  def get_data
    schedules_histories
    routes_histories
    drivers
    branches
    companies
    clients
    client_branches
  end
  
end
