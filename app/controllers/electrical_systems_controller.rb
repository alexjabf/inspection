class ElectricalSystemsController < ApplicationController 
  before_filter :get_data, :except => [:show, :destroy]  
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @electrical_systems }

    end
  end

  # GET /electrical_systems/1
  # GET /electrical_systems/1.json
  def show
    @electrical_system = ElectricalSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @electrical_system }
    end
  end

  # GET /electrical_systems/new
  # GET /electrical_systems/new.json
  def new
    @electrical_system = ElectricalSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @electrical_system }
    end
  end

  # GET /electrical_systems/1/edit
  def edit
    @electrical_system = ElectricalSystem.find(params[:id])
  end

  # POST /electrical_systems
  # POST /electrical_systems.json
  def create
    @electrical_system = ElectricalSystem.new(params[:electrical_system])
    @electrical_system.truck_id = @electrical_system.driver.truck_id
    respond_to do |format|
      if @electrical_system.save
        format.html { redirect_to @electrical_system, notice: 'Electrical system was successfully created.' }
        format.json { render json: @electrical_system, status: :created, location: @electrical_system }
      else
        format.html { render action: "new" }
        format.json { render json: @electrical_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /electrical_systems/1
  # PUT /electrical_systems/1.json
  def update
    @electrical_system = ElectricalSystem.find(params[:id])

    respond_to do |format|
      if @electrical_system.update_attributes(params[:electrical_system])
        format.html { redirect_to @electrical_system, notice: 'Electrical system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @electrical_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electrical_systems/1
  # DELETE /electrical_systems/1.json
  def destroy
    @electrical_system = ElectricalSystem.find(params[:id])
    @electrical_system.destroy

    respond_to do |format|
      format.html { redirect_to electrical_systems_url }
      format.json { head :no_content }
    end
  end
  
  def get_data
    electrical_systems
    drivers
    branches
    companies
  end
  
end
