class Unit < ActiveRecord::Base

  STICKER_COLORS = ['green', 'orange', 'pink', 'yellow']

  belongs_to :beer
  belongs_to :container

  validates_presence_of :beer, :container
  validates_uniqueness_of :identifier

  before_create :create_identifier

  private

  def create_identifier
    identifiers = self.class.pluck(:identifier)
    invalid = true
    while invalid
      self.identifier = SecureRandom.hex(2)
      invalid = identifiers.include?(self.identifier)
    end
    self.sticker_color = STICKER_COLORS.sample
  end
end
