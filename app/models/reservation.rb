class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :period

  attr_accessible :status

  def self.requests(venue_id, user_id)
    joins(:period => :venue)
      .where(:venues => {user_id: user_id, id: venue_id})
      .where(:status => :applyed)
  end

  def self.request(venue_id, hoster_id, user_id)
    requests(venue_id, hoster_id).where(user_id: user_id)
  end
end
