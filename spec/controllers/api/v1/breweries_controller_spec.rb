require 'rails_helper'

describe Api::V1::BreweriesController do
  describe '#create' do
    let(:name) { 'Test Brewery' }
    let(:required_brewery_params) do
      {
        name: name
      }
    end
    let(:optional_brewery_params) do
      {
        city: 'Chicago',
        state: 'IL'
      }
    end

    it 'persists a new Brewery record' do
      expect {
        post :create, brewery: required_brewery_params
      }.to change(Brewery, :count).by 1
    end

    it 'returns a serialized version of the new Brewery record'
  end
end
