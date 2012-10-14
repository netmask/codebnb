class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :period

  attr_accessible :status

  validates_uniqueness_of :user_id

  def self.requests(venue_id, user_id)
    joins(:period => :venue).where(:venues =>{user_id: user_id, id: venue_id})
  end

  def self.request(venue_id, hoster_id, requester_id)
    requests_for(venue_id, requester_id).where(:user_id: hoster_id)
  end
end
