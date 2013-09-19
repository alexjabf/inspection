class HydraulicSystemsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @hydraulic_systems = current_user.role.super_admin == true ? HydraulicSystem.order('id DESC').paginate(:page => params[:page]) : HydraulicSystem.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hydraulic_systems }

    end
  end

  # GET /hydraulic_systems/1
  # GET /hydraulic_systems/1.json
  def show
    @hydraulic_system = HydraulicSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hydraulic_system }
    end
  end

  # GET /hydraulic_systems/new
  # GET /hydraulic_systems/new.json
  def new
    @hydraulic_system = HydraulicSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hydraulic_system }
    end
  end

  # GET /hydraulic_systems/1/edit
  def edit
    @hydraulic_system = HydraulicSystem.find(params[:id])
  end

  # POST /hydraulic_systems
  # POST /hydraulic_systems.json
  def create
    @hydraulic_system = HydraulicSystem.new(params[:hydraulic_system])
    @hydraulic_system.truck_id = @hydraulic_system.driver.truck_id
    respond_to do |format|
      if @hydraulic_system.save
        format.html { redirect_to @hydraulic_system, notice: 'Hydraulic system was successfully created.' }
        format.json { render json: @hydraulic_system, status: :created, location: @hydraulic_system }
      else
        format.html { render action: "new" }
        format.json { render json: @hydraulic_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hydraulic_systems/1
  # PUT /hydraulic_systems/1.json
  def update
    @hydraulic_system = HydraulicSystem.find(params[:id])

    respond_to do |format|
      if @hydraulic_system.update_attributes(params[:hydraulic_system])
        format.html { redirect_to @hydraulic_system, notice: 'Hydraulic system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hydraulic_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hydraulic_systems/1
  # DELETE /hydraulic_systems/1.json
  def destroy
    @hydraulic_system = HydraulicSystem.find(params[:id])
    @hydraulic_system.destroy

    respond_to do |format|
      format.html { redirect_to hydraulic_systems_url }
      format.json { head :no_content }
    end
  end
end
