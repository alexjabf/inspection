class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :confirmable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :role
  belongs_to :branch
  belongs_to :company
  attr_accessible :active, :address1, :address2, :city, :country, :first_name, :last_name, :phone1, :phone2, :state, :zip, :role_id, :branch_id, :username, :confirmed_at, :branch_id, :company_id, :login
  attr_accessor :login, :fullname, :login
  
  belongs_to :role
  belongs_to :branch
  has_many :cellphones, :dependent => :destroy
  has_many :drivers, :dependent => :destroy
  validates :first_name, :last_name, :presence => true
  validates :username, :uniqueness => true
  validates_length_of :email, :maximum => 120
  validates_length_of :first_name, :last_name, :maximum => 30
  validates :username, :length => { :within => 8..30 }, :allow_blank => true
  validates :password, :length => { :within => 8..30 },  :allow_blank => true
  validates_format_of :email, :with => /^\w+([\.-]?\w+)*@[a-zA-Z0-9]+([\.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,3})+$/i, :allow_blank => true
  validates_format_of :username, :with => /^[\w\._]+$/i, :allow_blank => true, :message => "solo debe contener _ . letras o numeros."  
  validates_format_of :password, :with => /^[\w]+$/i, :allow_blank => true, :message => "solo debe contener letras y numeros."

  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  end
  
  #protected

  # Attempt to find a user by it's email. If a record is found, send new
  # password instructions to it. If not user is found, returns a new user
  # with an email not found error.
  def self.send_reset_password_instructions(attributes={})
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?
    recoverable
  end 

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |key, value| value.blank? }

    if attributes.size == required_attributes.size
      if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else  
        record = where(attributes).first
      end  
    end  

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end  
    end  
    record
  end

  def self.find_record(login)
    where(["username = :value OR email = :value", { :value => login }]).first
  end 

  public
  
  def fullname
    first_name.titlecase + " " + last_name.titlecase 
  end
  
  def name_username
    first_name.titlecase + " " + last_name.titlecase + " (" + username + ")"
  end 
  
  self.per_page = 15

end#EOF DO NOT DELETE THIS COMMENT

