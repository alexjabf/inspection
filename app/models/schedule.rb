class Schedule < ActiveRecord::Base
  belongs_to :company  
  belongs_to :branch
  belongs_to :driver
  belongs_to :client
  belongs_to :client_branch
  attr_accessible :friday, :monday, :saturday, :sunday, :thursday, :tuesday, :wednesday, :driver_id, :client_id, :branch_id, :company_id, :client_branch_id
  validates :client_id, :driver_id, :client_branch_id, :presence => true
  validates :branch_id, :company_id, :presence => true, :on => :update
  validates :client_branch_id, :uniqueness => true
  validate :checkbox_validation

  def checkbox_validation
    errors.add(:base, I18n.t('activerecord.errors.messages.you_need_to_select_at_least_one_day')) unless friday || monday || saturday || sunday || thursday || tuesday || wednesday
  end
  
  def selected_days
    client_branch.name + " (" +
      " #{I18n.t('monday') + " " if monday}" +
      " #{I18n.t('tuesday') + " " if tuesday}" +
      " #{I18n.t('wednesday') + " " if wednesday}" +
      " #{I18n.t('thursday') + " " if thursday}" +
      " #{I18n.t('friday') + " " if friday}" +
      " #{I18n.t('saturday') + " " if saturday}" +
      " #{I18n.t('sunday') + " " if sunday}"  + ") "
  end
  
    def human_name
    "(Id: " + id.to_s + ") " + I18n.t('schedules..show.client_branch_id') + selected_days + " - " + I18n.t('schedules.show.branch_id') + branch.name
  end
  
end
