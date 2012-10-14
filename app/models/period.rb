class Period < ActiveRecord::Base
  belongs_to :venue
  attr_accessible :ends, :start
end
