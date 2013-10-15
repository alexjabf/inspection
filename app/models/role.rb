class Role < ActiveRecord::Base
  belongs_to :branch
  belongs_to :company
  attr_accessible :company_admin, :branch_admin, :description, :driver, :name, :protected, :routes_admin, :super_admin, :branch_id, :company_id
  self.per_page = 15
end
