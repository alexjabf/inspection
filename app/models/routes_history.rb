class RoutesHistory < ActiveRecord::Base
  belongs_to :driver
  belongs_to :client
  belongs_to :client_branch
  belongs_to :branch
  belongs_to :company  
  has_many :schedules_histories, :dependent => :destroy
  has_many :failures_histories, :dependent => :destroy  
  attr_accessible :closed, :final_km, :finished_at, :initial_km, :started_at, :weekday, :driver_id, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :client_id, :branch_id, :company_id, :client_branch_id

  def human_name
    "(Id: " + id + ") " + I18n.t('routes_histories.client_branch')  + client_branch + " - " + I18n.t('routes_histories.branch') + branch
  end

end
