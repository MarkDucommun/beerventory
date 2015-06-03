require 'rails_helper'

describe Api::V1::BeersController do
  describe '#index' do
    it 'returns all beer records' do
      beers = create_list(:beer, 2)
      get :index
      beers_hash = parse_json_response_body(response).fetch(:beers)
      expect(beers_hash.length).to be beers.length
    end

    it 'can filter by brewery id' do
      brewery_a = create(:brewery)
      brewery_a_beer_count = 2

      create_list(:beer, brewery_a_beer_count, brewery: brewery_a)
      create_list(:beer, 2)

      get :index, beer: { brewery_id: brewery_a.id }
      beers_hash = parse_json_response_body(response).fetch(:beers)
      expect(beers_hash.length).to be brewery_a_beer_count
    end
  end

  describe '#show' do
    it 'returns the beer record' do
      beer = create(:beer)
      get :show, id: beer.id
      beer_hash = parse_json_response_body(response).fetch(:beer)
      expect(beer_hash[:id]).to be beer.id
    end
  end

  describe '#create' do
    let(:name) { 'Beer' }
    let(:brewery) { create(:brewery) }
    let(:style) { create(:style) }
    let(:required_beer_params) do
      {
        name: name,
        brewery_id: brewery.id
      }
    end
    let(:full_beer_params) do
      required_beer_params.merge(
        style_id: style.id
      )
    end

    it 'persists a new Beer record' do
      expect {
        post :create, beer: required_beer_params
      }.to change(Beer, :count).by 1
    end

    it 'returns a serialized version the new Beer record' do
      post :create,  beer: full_beer_params
      beer_hash = parse_json_response_body(response).fetch(:beer)
      expect(beer_hash[:id]).to_not be nil
      expect(beer_hash[:name]).to eq name
      expect(beer_hash[:brewery][:id]).to be brewery.id
      expect(beer_hash[:style][:id]).to be style.id
    end
  end

  describe '#update' do
    it 'updates the beer record and returns the updated beer record' do
      beer = create(:beer)
      new_brewery_id = create(:brewery).id
      put :update, id: beer.id, beer: {brewery_id: new_brewery_id}
      beer_hash = parse_json_response_body(response).fetch(:beer)
      expect(beer_hash[:brewery][:id]).to eq new_brewery_id
    end
  end

  describe '#destroy' do
    let!(:beer) { create(:beer) }

    it 'destroys the beer record' do
      expect {
        delete :destroy, id: beer.id
      }.to change(Beer, :count).by(-1)
    end

    it 'returns the destroyed beer record' do
      delete :destroy, id: beer.id
      beer_hash = parse_json_response_body(response).fetch(:beer)
      expect(beer_hash[:id]).to eq beer.id
    end
  end
end
