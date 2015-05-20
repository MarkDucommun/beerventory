class Unit < ActiveRecord::Base
  belongs_to :beer
  belongs_to :container

  validates_presence_of :beer, :container
end
