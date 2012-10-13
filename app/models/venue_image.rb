class VenueImage < ActiveRecord::Base
  belongs_to :venue_id
  attr_accessible :resource
end
