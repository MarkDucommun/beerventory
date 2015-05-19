class Beer < ActiveRecord::Base
  belongs_to :brewery

  validates_presence_of :name, :brewery
end
