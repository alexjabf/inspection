class Bill < ActiveRecord::Base
  belongs_to :client
  attr_accessible :address1, :address2, :city, :country, :email, :fax, :name, :phone1, :phone2, :rfc, :state, :zip
end
