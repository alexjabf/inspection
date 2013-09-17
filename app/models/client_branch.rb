class ClientBranch < ActiveRecord::Base
  belongs_to :client
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :fax, :name, :phone1, :phone2, :state, :webpage, :zip
end
