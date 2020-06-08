class User < ActiveRecord::Base
  has_many :instruments
  has_many :equipment
  has_secure_password
  validates_presence_of :username, :password_digest
end