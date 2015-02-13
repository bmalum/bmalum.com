class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User
  include Mongoid::Document

  attr_accessor :password
  attr_accessor :password_confirmation

  before_save :encrypt_password

  field :email, type: String
  field :password_hash, type: String
  field :password_salt, type: String
  field :role, type: Array, default: ["user"]

  validates :email, email: true

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_confirmation_of :password

def self.search(search)
  if search
    any_of({ :email => /.*#{search}.*/ })
  else
    all
  end
end

def self.authenticate(email, password)
  	user = find_by(email: email)
  	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  		user
  	else
  	nil
  end
end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def role_as_string
    role.join(',')
  end

  def role_as_string=(string)
    update_attributes(role: string.split(','))
  end

end
