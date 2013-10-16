class Driver < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  belongs_to :branch
  belongs_to :company
  has_many :tasks, :dependent => :destroy
  has_many :routes, :dependent => :destroy
  attr_accessible :user_id, :truck_id, :branch_id, :company_id
  validates :user_id, :truck_id, :presence => true
  validates :branch_id, :company_id, :presence => true, :on => :update
  public
  
  def driver_name
    user.fullname
  end
  
end
