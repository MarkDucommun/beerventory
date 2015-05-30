class Beer < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :style
  has_many :units

  validates_presence_of :name, :brewery
end
