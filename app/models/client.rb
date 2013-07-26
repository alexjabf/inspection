class Client < ActiveRecord::Base
  belongs_to :branch
  attr_accessible :address1, :address2, :city, :country, :email, :fax, :first_name, :last_name, :phone1, :phone2, :state, :zip, :branch_id
  has_many :bills, :dependent => :destroy
  attr_accessible :bills_attributes
  accepts_nested_attributes_for :bills, :allow_destroy => true
  has_many :orders, :dependent => :destroy
  validates :first_name, :last_name, :presence => true
  validates_length_of :email, :maximum => 120
  validates_length_of :first_name, :last_name, :maximum => 30
  validates_format_of :email, :with => /^\w+([\.-]?\w+)*@[a-zA-Z0-9]+([\.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,3})+$/i, :allow_blank => true
  self.per_page = 15
  
  public 
  def fullname
    first_name.titlecase + " " + last_name.titlecase 
  end
  
end
