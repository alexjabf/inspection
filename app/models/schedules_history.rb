class SchedulesHistory < ActiveRecord::Base
  belongs_to :routes_history
  belongs_to :client_branch
  belongs_to :branch
  belongs_to :company
  attr_accessible :visited, :visited_at, :routes_history_id, :client_id, :client_branch_id, :branch_id, :company_id
end
