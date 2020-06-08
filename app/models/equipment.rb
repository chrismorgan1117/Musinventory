class Equipment < ActiveRecord::Base
  #equipment belongs to the User
  belongs_to :user
end