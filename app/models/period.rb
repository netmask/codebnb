class Period < ActiveRecord::Base
  belongs_to :venue
  has_many :reservations

  attr_accessible :ends, :start

end
