class CabinsController < ApplicationController
  include DriversHelper
  before_filter :get_data  
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @cabins = current_user.role.super_admin == true ? Cabin.order('id DESC').paginate(:page => params[:page]) : Cabin.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cabins }

    end
  end

  # GET /cabins/1
  # GET /cabins/1.json
  def show
    @cabin = Cabin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cabin }
    end
  end

  # GET /cabins/new
  # GET /cabins/new.json
  def new
    @cabin = Cabin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cabin }
    end
  end

  # GET /cabins/1/edit
  def edit
    @cabin = Cabin.find(params[:id])
  end

  # POST /cabins
  # POST /cabins.json
  def create
    @cabin = Cabin.new(params[:cabin])
    @cabin.truck_id = @cabin.driver.truck_id
    respond_to do |format|
      if @cabin.save
        format.html { redirect_to @cabin, notice: 'Cabin was successfully created.' }
        format.json { render json: @cabin, status: :created, location: @cabin }
      else
        format.html { render action: "new" }
        format.json { render json: @cabin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cabins/1
  # PUT /cabins/1.json
  def update
    @cabin = Cabin.find(params[:id])

    respond_to do |format|
      if @cabin.update_attributes(params[:cabin])
        format.html { redirect_to @cabin, notice: 'Cabin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cabin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cabins/1
  # DELETE /cabins/1.json
  def destroy
    @cabin = Cabin.find(params[:id])
    @cabin.destroy

    respond_to do |format|
      format.html { redirect_to cabins_url }
      format.json { head :no_content }
    end
  end
  
  def get_data
    get_drivers
  end
  
end
