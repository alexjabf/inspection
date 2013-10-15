class UsersController < ApplicationController
  include RolesHelper
  include BranchesHelper  
  include CompaniesHelper 
  before_filter :authenticate_user!
  before_filter :get_data, :except => [:show, :index, :destroy]  
  before_filter :get_user_role, :except => [:index, :new, :create]
  load_and_authorize_resource
  
  def index
    @users = User.order('first_name ASC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def get_data
    get_roles
    get_branches
    get_companies
  end
  
  def get_user_role
    @user = User.find(params[:id])
    if @user.role.super_admin == true and current_user.role.super_admin == false
      flash[:error] = "Usted no tiene permiso para accesar a esta pagina."
      redirect_to root_path
    elsif @user.role.company_admin == true and current_user.role.super_admin == false and current_user.role.company_admin == false
      flash[:error] = "Usted no tiene permiso para accesar a esta pagina."
      redirect_to root_path   
    end
  end
  
end
