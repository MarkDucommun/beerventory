require 'rails_helper'

describe Unit do
  context 'associations' do
    it { should belong_to :beer }
    it { should belong_to :container }
  end

  context 'validations' do
    it { should validate_presence_of :beer }
    it { should validate_presence_of :container}
  end

  context 'after save' do
    it 'creates a unique identifier and issue a sticker color if prompted' do
      unit = create(:unit)
      expect(unit.identifier).to match(/[\da-f]{4}/)
      expect(unit.sticker_color).to_not be nil
    end
  end
end
