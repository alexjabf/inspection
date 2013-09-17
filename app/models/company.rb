class Company < ActiveRecord::Base
  has_many :branches
  has_many :clients
  has_many :users, :through => :branches
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :name, :name, :phone1, :phone2, :state, :webpage, :zip
  self.per_page = 15
end
