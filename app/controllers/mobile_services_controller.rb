class MobileServicesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
  end
  
  #before_filter :authenticate_user!
  before_filter :detect_platform
  respond_to :json
  layout false

  def get_driver_info
    @driver = Driver.find_by_user_id(params[:user_id])
    current_date = (I18n.l Time.now, :format => :long)
    render json: @driver.blank? ?  {'status' => t('messages.info.driver_not_found')} : [@driver, @driver.user, @driver.truck, @driver.company, @driver.branch, current_date]
  end
 
  def get_driver_schedule
    @schedules = eval("Schedule.where(:driver_id => params[:driver_id], :#{Time.now.strftime("%A").downcase} => #{true})")
    schedules = []
    x = 0
    @schedules.each do |schedule|
      schedules[x] = {'schedule' => {'company' => schedule.company, 'branch' => schedule.branch, 'client_branch' => schedule.client_branch, 'client' => schedule.client}}
      x += 1
    end
    schedules.each do |s|
      p s
    end
    render json: @schedules.blank? ?  {'status' => t('messages.info.schedule_not_found')} : schedules 
  end
  
  def start_route
    
  end
  
  def routes
    @routes_history = RoutesHistory.new(params[:routes_history])
    @routes_history.started_at = Time.now
    @routes_history.weekday = Time.now.strftime("%A").downcase
    if @routes_history.closed
      @routes_history = RoutesHistory.find(params[:id])
      if @routes_history.update_attributes(params[:routes_history])
        format.json { render json: {'routes_history' => {'response' => t('messages.alerts.end_ended_at') + (I18n.l Time.now, :format => :long), 'route' => @routes_history}}}
      else
        render json: t('messages.errors.end_route_error')
      end
    else
      respond_to do |format|
        if @routes_history.save
          @schedules = eval("Schedule.where(:driver_id => #{@routes_history.driver_id}, :#{Time.now.strftime("%A").downcase} => #{true})")
          @schedules.each do |schedule|
            SchedulesHistory.create(:routes_history_id => @routes_history.id, :client_id => schedule.client_id, :client_branch_id => schedule.client_branch_id, :branch_id => schedule.branch_id, :company_id => schedule.company_id)
          end
          format.json { render json: {'routes_history' => {'response' => t('messages.alerts.route_started_at') + (I18n.l Time.now, :format => :long), 'route' => @routes_history}}}
        else
          render json: t('messages.errors.start_route_error')
        end
      end 
    end
  end
  
  def detect_platform
    #        if request.env['HTTP_USER_AGENT'] == ""
    #          access = true
    #        else
    #          access = false
    #        end
    #        unless access
    #          flash[:alert] = t('no_access')
    #          redirect_to root_path
    #        end
  end
  
end
