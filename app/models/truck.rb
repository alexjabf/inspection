class Truck < ActiveRecord::Base
  belongs_to :branch
  belongs_to :company
  has_many :drivers, :dependent => :destroy
  attr_accessible :brand, :color, :identifier, :model, :other, :plate_no, :serial_no, :truck_type, :wheels_no, :year, :branch_id, :company_id
  validates :brand, :model, :plate_no, :branch_id, :presence => true
  validates_length_of :brand, :model, :other, :maximum => 150
  validates_length_of :year, :is => 4
  self.per_page = 15
  
  def modelbrand
    model.titlecase + " " + brand.titlecase + " (" + year.to_s + ")"
  end
end
