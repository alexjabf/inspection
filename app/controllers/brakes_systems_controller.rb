class BrakesSystemsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @brakes_systems = current_user.role.super_admin == true ? BrakesSystem.order('id DESC').paginate(:page => params[:page]) : BrakesSystem.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brakes_systems }

    end
  end

  # GET /brakes_systems/1
  # GET /brakes_systems/1.json
  def show
    @brakes_system = BrakesSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brakes_system }
    end
  end

  # GET /brakes_systems/new
  # GET /brakes_systems/new.json
  def new
    @brakes_system = BrakesSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brakes_system }
    end
  end

  # GET /brakes_systems/1/edit
  def edit
    @brakes_system = BrakesSystem.find(params[:id])
  end

  # POST /brakes_systems
  # POST /brakes_systems.json
  def create
    @brakes_system = BrakesSystem.new(params[:brakes_system])
    @brakes_system.truck_id = @brakes_system.driver.truck_id
    respond_to do |format|
      if @brakes_system.save
        format.html { redirect_to @brakes_system, notice: 'Brakes system was successfully created.' }
        format.json { render json: @brakes_system, status: :created, location: @brakes_system }
      else
        format.html { render action: "new" }
        format.json { render json: @brakes_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brakes_systems/1
  # PUT /brakes_systems/1.json
  def update
    @brakes_system = BrakesSystem.find(params[:id])

    respond_to do |format|
      if @brakes_system.update_attributes(params[:brakes_system])
        format.html { redirect_to @brakes_system, notice: 'Brakes system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brakes_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brakes_systems/1
  # DELETE /brakes_systems/1.json
  def destroy
    @brakes_system = BrakesSystem.find(params[:id])
    @brakes_system.destroy

    respond_to do |format|
      format.html { redirect_to brakes_systems_url }
      format.json { head :no_content }
    end
  end
end
