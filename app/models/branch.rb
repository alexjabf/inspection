class Branch < ActiveRecord::Base
  belongs_to :company
  attr_accessible :address1, :address2, :city, :country, :description, :email1, :email2, :name, :name, :phone1, :phone2, :state, :webpage, :zip, :company_id
end
