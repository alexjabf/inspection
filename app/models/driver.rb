class Driver < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  belongs_to :branch
  belongs_to :company
  attr_accessible :user_id, :truck_id, :branch_id, :company_id
  validates :user_id, :truck_id, :branch_id, :presence => true
  
  public
  def driver_name
    user.fullname
  end
  
end
