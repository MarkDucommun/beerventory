require 'rails_helper'

describe Unit do
  context 'validations' do
    it { should validate_presence_of :container}
  end
end
