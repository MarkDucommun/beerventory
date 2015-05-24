require 'spec_helper'

describe Beer do
  context 'associations' do
    it { should belong_to :brewery }
    it { should have_many :units }
  end

  context 'validations' do
    it { should validate_presence_of :brewery }
    it { should validate_presence_of :name }
  end
end
