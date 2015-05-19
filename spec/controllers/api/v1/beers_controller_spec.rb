require 'rails_helper'

describe Api::V1::BeersController do
  describe '#index' do
    it 'returns all beer records' do
      beers = create_list(:beer, 2)
      get :index
      beers_hash = parse_json_response_body(response).fetch(:beers)
      expect(beers_hash.length).to be beers.length
    end
  end

  describe '#create' do
    let(:name) { 'Test Beer' }
    let(:required_beer_params) do
      {
        name: name
      }
    end
    let(:full_beer_params) do
      required_beer_params.merge(
        bottling_date: 10.days.ago,
        purchase_date: Time.now,
        best_by_date: 2.months.from_now
      )
    end

    it 'persists a new Beer record' do
      expect {
        post :create, beer: required_beer_params
      }.to change(Beer, :count).by 1
    end

    it 'returns a serialized version of the new Beer record' do
      post :create, beer: full_beer_params
      beer_hash = parse_json_response_body(response).fetch(:beer)
      expect(beer_hash[:id]).to_not be_nil
      expect(beer_hash[:name]).to eq name
      expect(beer_hash[:bottling_date]).to_not be nil
      expect(beer_hash[:purchase_date]).to_not be nil
      expect(beer_hash[:best_by_date]).to_not be nil
    end
  end

  describe '#update' do
    it 'updates the beer record and returns the updated beer record' do
      beer = create(:beer)
      new_name = 'A New Name'
      put :update, id: beer.id, beer: {name: new_name}
      beer_hash = parse_json_response_body(response).fetch(:beer)
      expect(beer_hash[:name]).to eq new_name
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
      expect(beer_hash[:name]).to eq beer.name
    end
  end
end
