class DriveSystem < ActiveRecord::Base
  belongs_to :driver
  belongs_to :truck
  attr_accessible :arrows, :bands, :differential, :engine, :injection, :observations, :transmission, :yokes, :driver_id, :truck_id
end
