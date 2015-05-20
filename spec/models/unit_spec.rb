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
end
