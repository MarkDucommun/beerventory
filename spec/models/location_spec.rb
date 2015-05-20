require 'rails_helper'

describe Location do
  context 'validations' do
    it { should validate_presence_of :container }
    it { should validate_presence_of :room }
  end
end
