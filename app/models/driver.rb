class Driver < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  belongs_to :branch
  attr_accessible :user_id, :truck_id, :branch_id
end
