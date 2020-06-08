class User < ActiveRecord::Base
  #User has many equipment, secure password and should validate the presesnce of username and password
  has_many :equipment
  has_secure_password
  validates_presence_of :username, :password_digest
end