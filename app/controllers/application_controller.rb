class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_devise
  before_filter :get_data

  def get_data
    if signed_in?
      @branches = current_user.role.super_admin == true ? Branch.order('id DESC').paginate(:page => params[:page]) : Branch.where(:id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @clients = current_user.role.super_admin == true ? Client.order('id DESC').paginate(:page => params[:page]) : Client.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @bills = current_user.role.super_admin == true ? Bill.order('id DESC').paginate(:page => params[:page]) : Bill.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])  
      @users = current_user.role.super_admin == true ? User.order('id DESC').paginate(:page => params[:page]) : User.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @cellphones = current_user.role.super_admin == true ? Cellphone.order('id DESC').paginate(:page => params[:page]) : Cellphone.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @trucks = current_user.role.super_admin == true ? Truck.order('id DESC').paginate(:page => params[:page]) : Truck.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @roles = current_user.role.super_admin == true ? Role.order('id DESC').paginate(:page => params[:page]) : Role.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])   
    end
  end
  
  def layout_devise
    if devise_controller? and controller_name != "users"
      "devise"
    else
      "application"
    end
  end
  
  if Rails.env == "production" or Rails.env == "development" or Rails.env == "local"
    rescue_from Exception do |exception|#WORKS
      line_number = exception.backtrace.to_s.split(":in").first.gsub("[\"", "")
      flash[:error] = "Something went wrong: " + exception.to_s + " in " + line_number
      render welcome_index_path
      ErrorReport.create(:user => signed_in? ? current_user.fullname : "Guess User" , :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :branch_id => signed_in? ? current_user.branch_id : 0, :environment => Rails.env, :error_time => Time.now - 6.hours, :line_number => line_number, :backtrace => exception.backtrace)
    end
    rescue_from ActiveRecord::RecordNotFound do |exception|#WORKS
      line_number = exception.backtrace.to_s.split(":in").first.gsub("[\"", "")
      flash[:error] = "Something went wrong: " + exception.to_s + " in " + line_number
      render welcome_index_path
      ErrorReport.create(:user => signed_in? ? current_user.fullname : "Guess User" , :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :branch_id => signed_in? ? current_user.branch_id : 0, :environment => Rails.env, :error_time => Time.now - 6.hours, :line_number => line_number, :backtrace => exception.backtrace)
    end
  end

end
