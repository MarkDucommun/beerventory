class Location < ActiveRecord::Base
  validates_presence_of :container, :room
end
