class Client < ActiveRecord::Base
  belongs_to :company
  has_many :client_branches
  has_many :bills
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :fax, :name, :phone1, :phone2, :state, :webpage, :zip
end
