class User
  include Mongoid::Document
  field :email, type: String
  field :password_hash, type: String
  field :password_salt, type: String
end
