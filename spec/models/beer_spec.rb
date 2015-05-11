require 'rails_helper'

describe Beer do
  context 'validations' do
    it { should validate_presence_of :name}
  end
end
