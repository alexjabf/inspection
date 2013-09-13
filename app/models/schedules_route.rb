class SchedulesRoute < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :route
  attr_accessible :route_id, :schedule_id
  validates_uniqueness_of :schedule_id, :scope => :route_id
end
