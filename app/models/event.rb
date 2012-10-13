class Event < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :title, :url
end
