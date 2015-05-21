require 'rails_helper'

describe Location do
  context 'validations' do
    it { should validate_presence_of :container }
    it { should validate_presence_of :room }
  end

  context 'before save' do
    it 'can create a unique identifier and issue a sticker color if prompted' do
      location = Location.create(container: 'Case', room: 'Basement', identifier: true)
      expect(location.identifier).to match(/[\da-f]{2}/)
      expect(location.sticker_color).to_not be nil
    end
  end
end
