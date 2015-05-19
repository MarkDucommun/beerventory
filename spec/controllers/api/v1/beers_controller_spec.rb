require 'rails_helper'

describe Api::V1::BeersController do
  describe '#create' do
    let(:name) { 'Beer' }
    let(:brewery) { create(:brewery) }
    let(:required_beer_params) do
      {
        name: name,
        brewery_id: brewery.id
      }
    end

    it 'persists a new Beer record' do
      expect {
        post :create, beer: required_beer_params
      }.to change(Beer, :count).by 1
    end

    it 'returns a serialized version the new Beer record' do
      post :create,  beer: required_beer_params
      beer_hash = parse_json_response_body(response).fetch(:beer)
      expect(beer_hash[:id]).to_not be nil
      expect(beer_hash[:name]).to eq name
      expect(beer_hash[:brewery][:id]).to be brewery.id
    end
  end
end
