class Bill < ActiveRecord::Base
  belongs_to :client
  belongs_to :branch
  belongs_to :company  
  attr_accessible :address1, :address2, :city, :country, :email, :fax, :name, :phone1, :phone2, :rfc, :state, :zip, :client_id, :branch_id, :company_id
end
