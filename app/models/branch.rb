class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :roles
  has_many :error_reports
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :name, :name, :phone1, :phone2, :state, :webpage, :zip, :company_id
  self.per_page = 15
end
