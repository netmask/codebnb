class Venue < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  has_many :periods

  attr_accessible :description, :disclamer, :internet, :label, :latitude, :longitude,
                  :mates_allowed, :mates_quantity, :meals, :work_place, :name, :rooms

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

end
