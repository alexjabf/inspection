class MobileServicesController < ApplicationController
  def index
  end
  
  #before_filter :authenticate_user!
  before_filter :detect_platform
  respond_to :json
  layout false

  def get_driver_info
    @driver = Driver.find_by_user_id(params[:user_id])
    render json: @driver.blank? ?  {'status' => t('driver_not_found')} : [@driver.truck, @driver.company, @driver.branch]
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
    render json: @schedules.blank? ?  {'status' => t('schedule_not_found')} : schedules 
  end
  
  
  def detect_platform
    #    if request.env['HTTP_USER_AGENT'] == ""
    #      access = true
    #    else
    #      access = false
    #    end
    #    unless access
    #      flash[:alert] = t('no_access')
    #      redirect_to root_path
    #    end
  end
  
end
