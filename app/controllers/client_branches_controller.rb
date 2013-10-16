class ClientBranchesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_branches }

    end
  end

  # GET /client_branches/1
  # GET /client_branches/1.json
  def show
    @client_branch = ClientBranch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_branch }
    end
  end

  # GET /client_branches/new
  # GET /client_branches/new.json
  def new
    @client_branch = ClientBranch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_branch }
    end
  end

  # GET /client_branches/1/edit
  def edit
    @client_branch = ClientBranch.find(params[:id])
  end

  # POST /client_branches
  # POST /client_branches.json
  def create
    @client_branch = ClientBranch.new(params[:client_branch])

    respond_to do |format|
      if @client_branch.save
        format.html { redirect_to @client_branch, notice: 'Client branch was successfully created.' }
        format.json { render json: @client_branch, status: :created, location: @client_branch }
      else
        format.html { render action: "new" }
        format.json { render json: @client_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_branches/1
  # PUT /client_branches/1.json
  def update
    @client_branch = ClientBranch.find(params[:id])

    respond_to do |format|
      if @client_branch.update_attributes(params[:client_branch])
        format.html { redirect_to @client_branch, notice: 'Client branch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_branches/1
  # DELETE /client_branches/1.json
  def destroy
    @client_branch = ClientBranch.find(params[:id])
    @client_branch.destroy

    respond_to do |format|
      format.html { redirect_to client_branches_url }
      format.json { head :no_content }
    end
  end
  
  def get_client_branches
    @client_branches = ClientBranch.where(:client_id => params[:client_id])
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @client_branches, :callback => params[:callback] }     
      end
    end
  end
  
  def get_data
    clients
    client_branches
    branches
    companies
  end
  
end
