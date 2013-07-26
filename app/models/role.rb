class Role < ActiveRecord::Base
  belongs_to :branch
  attr_accessible :branch_admin, :description, :driver, :name, :protected, :routes_admin, :super_admin, :branch_id
  self.per_page = 15
end
