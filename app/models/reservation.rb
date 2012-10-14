class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :period

  attr_accessible :status

  validates_uniqueness_of :user_id

  def self.requests_for(venue_id, user_id)
    joins(:period => :venue).where(:venues =>{user_id: user_id, id: venue_id})
  end

end
