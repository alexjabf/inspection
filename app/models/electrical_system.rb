class ElectricalSystem < ActiveRecord::Base
  belongs_to :driver
  belongs_to :truck
  attr_accessible :accumulator, :lights, :observations, :start_up, :driver_id, :truck_id
end
