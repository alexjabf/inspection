class RoutesHistory < ActiveRecord::Base
  belongs_to :driver
  belongs_to :client
  belongs_to :client_branch
  belongs_to :branch
  belongs_to :company  
  has_many :schedules_histories, :dependent => :destroy
  has_many :failures_histories, :dependent => :destroy  
  attr_accessible :closed, :final_km, :finished_at, :initial_km, :started_at, :weekday, :driver_id, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :client_id, :branch_id, :company_id, :client_branch_id, :schedule_id
  attr_accessor :schedule_id
  validates :schedule_id, :initial_km, :started_at, :weekday, :driver_id, :presence => true
  def human_name
    "(Id: " + id.to_s + ") " + I18n.t('routes_histories.show.client_branch_id') +  " " + client_branch.name + " - " + I18n.t('routes_histories.show.branch_id') +  " " + branch.name
  end

end
