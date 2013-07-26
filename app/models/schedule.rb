class Schedule < ActiveRecord::Base
  belongs_to :branch
  belongs_to :driver
  belongs_to :client
  attr_accessible :friday, :monday, :saturday, :sunday, :thursday, :tuesday, :wednesday, :driver_id, :client_id, :branch_id
  validates :client_id, :driver_id, :branch_id, :presence => true
  validates :client_id, :uniqueness => true
end
