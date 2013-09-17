class Cellphone < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
  belongs_to :company
  attr_accessible :brand, :color, :condition, :description, :imei, :model, :ope_system, :phone_number, :user_id, :branch_id, :company_id
  validates :brand, :model, :imei, :branch_id, :presence => true
  self.per_page = 10
end
