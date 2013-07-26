class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :roles
  has_many :error_reports
  has_many :clients
  has_many :bills
  has_many :trucks
  has_many :cellphones
  has_many :trucks
  has_many :drivers
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :name, :name, :phone1, :phone2, :state, :webpage, :zip, :company_id
  self.per_page = 15
end
