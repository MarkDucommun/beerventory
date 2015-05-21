require 'rails_helper'

describe Api::V1::LocationsController do
  describe '#index' do
    it 'returns all location records' do
      locations = create_list(:location, 2)
      get :index
      locations_hash = parse_json_response_body(response).fetch(:locations)
      expect(locations_hash.length).to be locations.length
    end
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
    it 'updates the location record and returns the updated location record' do
      location = create(:location)
      new_room = 'Living Room'
      put :update, id: location.id, location: {room: new_room}
      location_hash = parse_json_response_body(response).fetch(:location)
      expect(location_hash[:room]).to eq new_room
    end
  end

  describe '#delete' do
    let!(:location) { create(:location) }

    it 'destroys the location record' do
      expect {
        delete :destroy, id: location.id
      }.to change(Location, :count).by(-1)
    end

    it 'returns the destroyed location record' do
      delete :destroy, id: location.id
      location_hash = parse_json_response_body(response).fetch(:location)
      expect(location_hash[:id]).to_not be nil
    end
  end
end
