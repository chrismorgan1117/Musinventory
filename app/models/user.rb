class User < ActiveRecord::Base
  has_many :instruments#possibly ditch
  has_many :equipment
  #has_many :check_lists
  has_secure_password
  validates_presence_of :username, :password_digest
end