class ErrorReport < ActiveRecord::Base
  belongs_to :branch
  attr_accessible :action_name, :backtrace, :controller_name, :description, :environment, :error_time, :line_number, :original_path, :referrer_url, :user, :branch_id
  self.per_page = 15
end
