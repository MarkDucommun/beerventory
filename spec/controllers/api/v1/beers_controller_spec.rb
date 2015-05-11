require 'rails_helper'

describe Api::V1::BeersController do
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

    it 'should return a serialized version of the new Beer record' do
      post :create, beer: full_beer_params
      beer_json = JSON.parse(response.body).with_indifferent_access
      expect(beer_json[:beer][:name]).to eq name
      expect(beer_json[:beer][:bottling_date]).to_not be nil
      expect(beer_json[:beer][:purchase_date]).to_not be nil
      expect(beer_json[:beer][:best_by_date]).to_not be nil
    end
  end
end
