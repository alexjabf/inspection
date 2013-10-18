class RoutesHistoriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes_histories }

    end
  end

  # GET /routes_histories/1
  # GET /routes_histories/1.json
  def show
    @routes_history = RoutesHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @routes_history }
    end
  end

  # GET /routes_histories/new
  # GET /routes_histories/new.json
  def new
    @routes_history = RoutesHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @routes_history }
    end
  end

  # GET /routes_histories/1/edit
  def edit
    @routes_history = RoutesHistory.find(params[:id])
  end

  # POST /routes_histories
  # POST /routes_histories.json
  def create
    @routes_history = RoutesHistory.new(params[:routes_history])
    @schedule = Schedule.find_by_id(@routes_history.schedule_id)
    @routes_history.weekday = Time.now.strftime("%A").downcase
    @routes_history.company_id = @schedule.company_id
    @routes_history.branch_id = @schedule.branch_id
    @routes_history.client_id = @schedule.client_id
    @routes_history.client_branch_id = @schedule.client_branch_id
    @routes_history.driver_id = @schedule.driver_id
    respond_to do |format|
      if @routes_history.save
        @schedules = eval("Schedule.where(:driver_id => #{@routes_history.driver_id}, :#{Time.now.strftime("%A").downcase} => #{true})")
        @schedules.each do |schedule|
          SchedulesHistory.create(:routes_history_id => @routes_history.id, :client_id => schedule.client_id, :client_branch_id => schedule.client_branch_id, :branch_id => schedule.branch_id, :company_id => schedule.company_id)
        end
        format.html { redirect_to @routes_history, notice: 'Routes history was successfully created.' }
        format.json { render json: @routes_history, status: :created, location: @routes_history }
      else
        format.html { render action: "new" }
        format.json { render json: @routes_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routes_histories/1
  # PUT /routes_histories/1.json
  def update
    @routes_history = RoutesHistory.find(params[:id])

    respond_to do |format|
      if @routes_history.update_attributes(params[:routes_history])
        format.html { redirect_to @routes_history, notice: 'Routes history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @routes_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes_histories/1
  # DELETE /routes_histories/1.json
  def destroy
    @routes_history = RoutesHistory.find(params[:id])
    @routes_history.destroy

    respond_to do |format|
      format.html { redirect_to routes_histories_url }
      format.json { head :no_content }
    end
  end
  
  def get_data
    schedules
    routes_histories
    drivers
    branches
    companies
    clients
    client_branches
  end
  
  
end
