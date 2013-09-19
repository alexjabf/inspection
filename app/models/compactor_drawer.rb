class CompactorDrawer < ActiveRecord::Base
  belongs_to :driver
  belongs_to :truck
  attr_accessible :curtain, :floor, :iron, :observations, :roof, :shovel, :walls, :driver_id, :truck_id
end
