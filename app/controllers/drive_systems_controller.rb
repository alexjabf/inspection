class DriveSystemsController < ApplicationController
  before_filter :get_data, :except => [:show, :destroy]  
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drive_systems }

    end
  end

  # GET /drive_systems/1
  # GET /drive_systems/1.json
  def show
    @drive_system = DriveSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drive_system }
    end
  end

  # GET /drive_systems/new
  # GET /drive_systems/new.json
  def new
    @drive_system = DriveSystem.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drive_system }
    end
  end

  # GET /drive_systems/1/edit
  def edit
    @drive_system = DriveSystem.find(params[:id])
  end

  # POST /drive_systems
  # POST /drive_systems.json
  def create
    @drive_system = DriveSystem.new(params[:drive_system])
    @drive_system.truck_id = @drive_system.driver.truck_id
    respond_to do |format|
      if @drive_system.save
        format.html { redirect_to @drive_system, notice: 'Drive system was successfully created.' }
        format.json { render json: @drive_system, status: :created, location: @drive_system }
      else
        format.html { render action: "new" }
        format.json { render json: @drive_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drive_systems/1
  # PUT /drive_systems/1.json
  def update
    @drive_system = DriveSystem.find(params[:id])

    respond_to do |format|
      if @drive_system.update_attributes(params[:drive_system])
        format.html { redirect_to @drive_system, notice: 'Drive system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drive_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drive_systems/1
  # DELETE /drive_systems/1.json
  def destroy
    @drive_system = DriveSystem.find(params[:id])
    @drive_system.destroy

    respond_to do |format|
      format.html { redirect_to drive_systems_url }
      format.json { head :no_content }
    end
  end
  
  def get_data
    drive_systems
    drivers
    branches
    companies
  end
  
end
