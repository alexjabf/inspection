class Task < ActiveRecord::Base
  belongs_to :driver
  belongs_to :branch
  belongs_to :company
  attr_accessible :comments, :completed, :completed_at, :description, :latitude, :longitude, :name, :priority, :scheduled_date, :driver_id, :branch_id, :company_id
end
