class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :units

  validates_presence_of :name, :brewery
end
