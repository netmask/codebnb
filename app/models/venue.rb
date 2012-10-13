class Venue < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  attr_accessible :description, :disclamer, :internet, :label, :latitude, :longitude,
                  :mates_allowed, :mates_quantity, :meals, :work_place, :name, :rooms
end
