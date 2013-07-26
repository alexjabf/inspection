class Client < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :country, :first_name, :last_name, :phone1, :phone2, :state, :zip, :email
  validates :first_name, :last_name, :presence => true
  validates_length_of :email, :maximum => 120
  validates_length_of :first_name, :last_name, :maximum => 30
  validates_format_of :email, :with => /^\w+([\.-]?\w+)*@[a-zA-Z0-9]+([\.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,3})+$/i, :allow_blank => true
  def fullname
    first_name.titlecase + " " + last_name.titlecase 
  end
  
  def name_username
    first_name.titlecase + " " + last_name.titlecase + " (" + username + ")"
  end 
  
  def name_client_id
    first_name.titlecase + " " + last_name.titlecase + " ( Client No: " + id + ")"
  end 
  self.per_page = 15
end