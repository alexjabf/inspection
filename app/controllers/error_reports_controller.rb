class ErrorReportsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @error_reports = ErrorReport.order("id DESC").paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @error_reports }

    end
  end

  # GET /error_reports/1
  # GET /error_reports/1.json
  def show
    @error_report = ErrorReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @error_report }
    end
  end

  # GET /error_reports/new
  # GET /error_reports/new.json
  def new
    @error_report = ErrorReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @error_report }
    end
  end

  # GET /error_reports/1/edit
  def edit
    @error_report = ErrorReport.find(params[:id])
  end

  # POST /error_reports
  # POST /error_reports.json
  def create
    @error_report = ErrorReport.new(params[:error_report])

    respond_to do |format|
      if @error_report.save
        format.html { redirect_to @error_report, notice: 'Error report was successfully created.' }
        format.json { render json: @error_report, status: :created, location: @error_report }
      else
        format.html { render action: "new" }
        format.json { render json: @error_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /error_reports/1
  # PUT /error_reports/1.json
  def update
    @error_report = ErrorReport.find(params[:id])

    respond_to do |format|
      if @error_report.update_attributes(params[:error_report])
        format.html { redirect_to @error_report, notice: 'Error report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @error_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /error_reports/1
  # DELETE /error_reports/1.json
  def destroy
    @error_report = ErrorReport.find(params[:id])
    @error_report.destroy

    respond_to do |format|
      format.html { redirect_to error_reports_url }
      format.json { head :no_content }
    end
  end
end
