class Route < ActiveRecord::Base
  belongs_to :schedule
  attr_accessible :name, :schedule
  has_many :schedules_routes, :dependent => :destroy
  has_many :schedules, :through => :schedules_routes, :uniq => true
  attr_accessible :schedules_routes_attributes
  accepts_nested_attributes_for :schedules_routes, :allow_destroy => true
end
