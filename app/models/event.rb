class Event < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :title, :url, :address
  reverse_geocoded_by :latitude, :longitude, :address => :location
  after_validation :reverse_geocode

end
