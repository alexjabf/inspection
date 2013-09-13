class Schedule < ActiveRecord::Base
  belongs_to :branch
  belongs_to :driver
  belongs_to :client
  attr_accessible :friday, :monday, :saturday, :sunday, :thursday, :tuesday, :wednesday, :driver_id, :client_id, :branch_id
  validates :client_id, :driver_id, :branch_id, :presence => true
  validates :client_id, :uniqueness => true
  
  def select_schedule
    #    client.first_name.titlecase + " " + client.last_name.titlecase + " (#{
    #    "t(:monday)" if monday 
    #    "t(:tuesday)" if tuesday 
    #    "t(:wednesday)" if wednesday 
    #    "t(:thursday)" if thursday 
    #    "t(:friday)" if friday 
    #    "t(:saturday)" if saturday 
    #    "t(:sunday)" if sunday 
    #})"
    
    client.first_name.titlecase + " " + client.last_name.titlecase + " (" +
      " #{I18n.t('monday') + " " if monday}" +
      " #{I18n.t('tuesday') + " " if tuesday}" +
      " #{I18n.t('wednesday') + " " if wednesday}" +
      " #{I18n.t('thursday') + " " if thursday}" +
      " #{I18n.t('friday') + " " if friday}" +
      " #{I18n.t('saturday') + " " if saturday}" +
      " #{I18n.t('sunday') + " " if sunday}"  + ")"
  end
  
end
