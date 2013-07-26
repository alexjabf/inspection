class CellphonesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @cellphones = current_user.role.super_admin == true ? Cellphone.order('id DESC').paginate(:page => params[:page]) : Cellphone.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cellphones }

    end
  end

  # GET /cellphones/1
  # GET /cellphones/1.json
  def show
    @cellphone = Cellphone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cellphone }
    end
  end

  # GET /cellphones/new
  # GET /cellphones/new.json
  def new
    @cellphone = Cellphone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cellphone }
    end
  end

  # GET /cellphones/1/edit
  def edit
    @cellphone = Cellphone.find(params[:id])
  end

  # POST /cellphones
  # POST /cellphones.json
  def create
    @cellphone = Cellphone.new(params[:cellphone])

    respond_to do |format|
      if @cellphone.save
        format.html { redirect_to @cellphone, notice: 'Cellphone was successfully created.' }
        format.json { render json: @cellphone, status: :created, location: @cellphone }
      else
        format.html { render action: "new" }
        format.json { render json: @cellphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cellphones/1
  # PUT /cellphones/1.json
  def update
    @cellphone = Cellphone.find(params[:id])

    respond_to do |format|
      if @cellphone.update_attributes(params[:cellphone])
        format.html { redirect_to @cellphone, notice: 'Cellphone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cellphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cellphones/1
  # DELETE /cellphones/1.json
  def destroy
    @cellphone = Cellphone.find(params[:id])
    @cellphone.destroy

    respond_to do |format|
      format.html { redirect_to cellphones_url }
      format.json { head :no_content }
    end
  end
end
