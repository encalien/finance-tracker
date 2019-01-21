class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :folowee, :class_name => 'User'
end
