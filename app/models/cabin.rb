class Cabin < ActiveRecord::Base
  belongs_to :driver
  belongs_to :truck
  attr_accessible :crystals, :door_locks, :doors, :elevators, :mirrors, :observations, :driver_id, :truck_id
end
