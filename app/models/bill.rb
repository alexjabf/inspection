class Bill < ActiveRecord::Base
  belongs_to :client
  belongs_to :branch
  attr_accessible :address1, :address2, :city, :country, :email, :fax, :name, :phone1, :phone2, :rfc, :state, :zip, :branch_id, :client_id
  self.per_page = 15
end
