class RoutesHistory < ActiveRecord::Base
  belongs_to :driver
  belongs_to :client
  belongs_to :client_branch
  belongs_to :branch
  belongs_to :company  
  has_many :schedules_histories, :dependent => :destroy
  has_many :failures_histories, :dependent => :destroy  
  attr_accessible :closed, :final_km, :finished_at, :initial_km, :started_at, :weekday, :driver_id, :start_latitude, :start_longitude, :end_latitude, :end_longitude, :branch_id, :company_id
  validates :initial_km, :started_at, :weekday, :driver_id, :presence => true
  validates :final_km, :presence => true, :on => :update
  validate :final_initial_km, :on => :update

  def final_initial_km
    unless final_km.nil?
      if initial_km >= final_km
        errors.add(:base, I18n.t("messages.errors.final_initial_km"))
      end
    end
  end

  def human_name
    "(Id: " + id.to_s + ") " + I18n.t('routes_histories.show.branch_id') +  " " + branch.name
  end

end
