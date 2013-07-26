class Truck < ActiveRecord::Base
  belongs_to :branch
  attr_accessible :brand, :color, :identifier, :model, :other, :plate_no, :serial_no, :truck_type, :wheels_no, :year, :branch_id
  self.per_page = 15
end
