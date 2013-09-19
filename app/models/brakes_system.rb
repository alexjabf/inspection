class BrakesSystem < ActiveRecord::Base
  belongs_to :driver
  belongs_to :truck
  attr_accessible :balata, :bands, :compressor, :double_chambers, :drums, :dual, :hoses, :mass, :observations, :palancon, :valve, :driver_id, :truck_id
end
