class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  belongs_to :period

  attr_accessible :status

  def self.requests(user_id)
    joins(:period => :venue)
      .where(:venues => {user_id: user_id})
      .where(:status => :applyed)
  end

  def self.request(venue_id, hoster_id, user_id)
    requests(hoster_id).where(user_id: user_id)
  end
end
