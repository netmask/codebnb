class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :period
  attr_accessible :status
end
