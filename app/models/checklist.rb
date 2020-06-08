class CheckList < ActiveRecord::Base
  belongs_to :user
  has_many :equipment
end
#where check lists would has_many :equipment and belong_to :user
#allowing for custom user created lists of eqiupment for certain scenarios