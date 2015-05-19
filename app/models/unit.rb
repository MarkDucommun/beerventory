class Unit < ActiveRecord::Base
  belongs_to :container

  validates_presence_of :container
end
