class Period < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :end, :start
end
