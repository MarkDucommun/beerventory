require 'rails_helper'

describe Api::V1::LocationsController do
  describe '#index' do
  end

  describe '#create' do
    let(:container) { 'Refridgerator' }
    let(:room) { 'Basement' }
    let(:required_location_params) do
      {
        container: container,
        room: room
      }
    end

    it 'persists a new Location record' do
      expect {
        post :create, location: required_location_params
      }.to change(Location, :count).by 1
    end

    it 'returns a serialized version of the new Location record' do
      post :create, location: required_location_params
      location_hash = parse_json_response_body(response).fetch(:location)
      expect(location_hash[:id]).to_not be nil
      expect(location_hash[:container]).to eq container
      expect(location_hash[:room]).to eq room
    end
  end

  describe '#update' do
  end

  describe '#delete' do
  end

end
