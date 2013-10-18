class Client < ActiveRecord::Base
  belongs_to :branch
  belongs_to :company
  has_many :client_branches
  has_many :bills
  has_many :schedules, :dependent => :destroy
  has_many :routes_schedules, :dependent => :destroy
  has_many :schedules_histories, :dependent => :destroy
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :fax, :name, :phone1, :phone2, :state, :webpage, :zip, :branch_id, :company_id, :branch_id, :contact_name
end
