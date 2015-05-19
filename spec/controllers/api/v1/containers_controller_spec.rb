require 'rails_helper'

describe Api::V1::ContainersController do
  describe '#create' do
    let(:type) { 'Bottle' }
    let(:volume) { 750 }
    let(:volume_unit) { 'ml' }
    let(:name) { 'bomber' }
    let(:required_container_params) do
      {
        type: type,
        volume: volume,
        volume_unit: volume_unit
      }
    end
    let(:full_container_params) do
      required_container_params.merge(
        name: name
      )
    end

    it 'persists a new Container record' do
      expect {
        post :create, container: required_container_params
      }.to change(Container, :count).by 1
    end

    it 'returns a serialized version of the new Container record' do
      post :create, container: full_container_params
      container_hash = parse_json_response_body(response).fetch(:container)
      expect(container_hash[:id]).to_not be_nil
      expect(container_hash[:type]).to eq type
      expect(container_hash[:volume]).to eq volume
      expect(container_hash[:volume_unit]).to eq volume_unit
      expect(container_hash[:name]).to eq name
    end
  end
end
