require 'rails_helper'

describe Api::V1::BreweriesController do
  describe '#index' do
    it 'returns all brewery records' do
      breweries = create_list(:brewery, 2)
      get :index
      breweries_hash = parse_json_response_body(response).fetch(:breweries)
      expect(breweries_hash.length).to be breweries.length
    end
  end

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
      brewery_hash = parse_json_response_body(response).fetch(:brewery)
      expect(brewery_hash[:name]).to eq name
      expect(brewery_hash[:city]).to eq city
      expect(brewery_hash[:state]).to eq state
      expect(brewery_hash[:id]).to_not be nil
    end
  end

  describe '#update' do
    it 'updates the brewery record and returns the updated brewery record' do
      brewery = create(:brewery)
      new_name = 'A New Name'
      put :update, id: brewery.id, brewery: {name: new_name}
      brewery_hash = parse_json_response_body(response).fetch(:brewery)
      expect(brewery_hash[:name]).to eq new_name
    end
  end

  describe '#delete' do
    let!(:brewery) { create(:brewery) }

    it 'destroys the brewery record' do
      expect {
        delete :destroy, id: brewery.id
      }.to change(Brewery, :count).by(-1)
    end

    it 'returns the destroyed brewery record' do
      delete :destroy, id: brewery.id
      brewery_hash = parse_json_response_body(response).fetch(:brewery)
      expect(brewery_hash[:id]).to eq brewery.id
      expect(brewery_hash[:name]).to eq brewery.name
    end
  end
end
