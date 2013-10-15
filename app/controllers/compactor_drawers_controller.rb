class CompactorDrawersController < ApplicationController
  include DriversHelper
  before_filter :get_data
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @compactor_drawers = current_user.role.super_admin == true ? CompactorDrawer.order('id DESC').paginate(:page => params[:page]) : CompactorDrawer.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compactor_drawers }

    end
  end

  # GET /compactor_drawers/1
  # GET /compactor_drawers/1.json
  def show
    @compactor_drawer = CompactorDrawer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compactor_drawer }
    end
  end

  # GET /compactor_drawers/new
  # GET /compactor_drawers/new.json
  def new
    @compactor_drawer = CompactorDrawer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compactor_drawer }
    end
  end

  # GET /compactor_drawers/1/edit
  def edit
    @compactor_drawer = CompactorDrawer.find(params[:id])
  end

  # POST /compactor_drawers
  # POST /compactor_drawers.json
  def create
    @compactor_drawer = CompactorDrawer.new(params[:compactor_drawer])
    @compactor_drawer.truck_id = @compactor_drawer.driver.truck_id
    respond_to do |format|
      if @compactor_drawer.save
        format.html { redirect_to @compactor_drawer, notice: 'Compactor drawer was successfully created.' }
        format.json { render json: @compactor_drawer, status: :created, location: @compactor_drawer }
      else
        format.html { render action: "new" }
        format.json { render json: @compactor_drawer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /compactor_drawers/1
  # PUT /compactor_drawers/1.json
  def update
    @compactor_drawer = CompactorDrawer.find(params[:id])

    respond_to do |format|
      if @compactor_drawer.update_attributes(params[:compactor_drawer])
        format.html { redirect_to @compactor_drawer, notice: 'Compactor drawer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compactor_drawer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compactor_drawers/1
  # DELETE /compactor_drawers/1.json
  def destroy
    @compactor_drawer = CompactorDrawer.find(params[:id])
    @compactor_drawer.destroy

    respond_to do |format|
      format.html { redirect_to compactor_drawers_url }
      format.json { head :no_content }
    end
  end
  
  def get_data
    get_drivers
  end
  
end
