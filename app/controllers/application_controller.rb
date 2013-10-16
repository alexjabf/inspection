class ApplicationController < ActionController::Base
  include ApplicationHelper 
  protect_from_forgery
  
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
