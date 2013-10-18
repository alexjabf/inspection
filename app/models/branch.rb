class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :roles, :dependent => :destroy
  has_many :error_reports, :dependent => :destroy
  has_many :bills, :dependent => :destroy
  has_many :trucks, :dependent => :destroy
  has_many :cellphones, :dependent => :destroy
  has_many :drivers, :dependent => :destroy
  has_many :users, :dependent => :destroy
  has_many :clients, :dependent => :destroy
  has_many :client_branches, :dependent => :destroy 
  has_many :schedules, :dependent => :destroy
  has_many :routes_schedules, :dependent => :destroy
  has_many :schedules_histories, :dependent => :destroy
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :name, :name, :phone1, :phone2, :state, :webpage, :zip, :company_id, :contact_name
  self.per_page = 15
end
