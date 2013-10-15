class RoutesHistory < ActiveRecord::Base
  belongs_to :driver
  has_many :schedules_histories
  has_many :failures_histories  
  attr_accessible :closed, :final_km, :finished_at, :initial_km, :started_at, :weekday, :driver_id, :start_latitude, :start_longitude, :end_latitude, :end_longitude
end
