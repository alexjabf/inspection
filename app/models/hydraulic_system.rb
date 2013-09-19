class HydraulicSystem < ActiveRecord::Base
  belongs_to :driver
  belongs_to :truck
  attr_accessible :car_jack, :hoses, :joystick, :observations, :pto, :pump, :valve_box, :driver_id, :truck_id
end
