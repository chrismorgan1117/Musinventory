class User < ActiveRecord::Base
  has_many :instruments
  has_many :equipment
  validates_presence_of :username, :password_digest
end