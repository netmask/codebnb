class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :period

  attr_accessible :status

  validates_uniqueness_of :user_id

end
