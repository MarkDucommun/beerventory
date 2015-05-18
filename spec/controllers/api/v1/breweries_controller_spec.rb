require 'rails_helper'

describe Api::V1::BreweriesController do
  describe '#create' do
    let(:name) { 'Test Brewery' }
    let(:city) { 'Chicago' }
    let(:state) { 'IL' }
    let(:required_brewery_params) do
      {
        name: name
      }
    end
    let(:full_brewery_params) do
      required_brewery_params.merge(
        city: city,
        state: state
      )
    end

    it 'persists a new Brewery record' do
      expect {
        post :create, brewery: required_brewery_params
      }.to change(Brewery, :count).by 1
    end

    it 'returns a serialized version of the new Brewery record' do
      post :create, brewery: full_brewery_params
      brewery_json = JSON.parse(response.body).with_indifferent_access
      expect(brewery_json[:brewery][:name]).to eq name
      expect(brewery_json[:brewery][:city]).to eq city
      expect(brewery_json[:brewery][:state]).to eq state
      expect(brewery_json[:brewery][:id]).to_not be nil
    end
  end

  describe '#update' do
    it 'updates the brewery record and returns the updated brewery record' do
      brewery = create(:brewery)
      new_name = 'A New Name'
      put :update, id: brewery.id, brewery: {name: new_name}
      brewery_json = JSON.parse(response.body).with_indifferent_access
      expect(brewery_json[:brewery][:name]).to eq new_name
    end
  end
end
