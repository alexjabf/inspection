class FailuresHistory < ActiveRecord::Base
  belongs_to :routes_history
  attr_accessible :failure_id, :failure_type, :routes_history_id
end
