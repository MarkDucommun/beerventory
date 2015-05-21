class Location < ActiveRecord::Base

  STICKER_COLORS = ['green', 'orange', 'pink', 'yellow']

  validates_presence_of :container, :room
  validates_uniqueness_of :identifier, if: 'identifier.present?'

  before_create :create_identifier

  private

  def create_identifier
    if identifier == 't'
      invalid = true
      while invalid
        self.identifier = SecureRandom.hex(1)
        valid?
        invalid = errors.messages[:identifier]
      end
      self.sticker_color = STICKER_COLORS.sample
    end
  end
end
