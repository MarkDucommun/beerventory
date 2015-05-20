require 'rails_helper'

describe Api::V1::UnitsController do
  describe '#index' do
    it 'returns all unit records' do
      units = create_list(:unit, 2)
      get :index
      units_hash = parse_json_response_body(response).fetch(:units)
      expect(units_hash.length).to be units.length
    end
  end

  describe '#create' do
    let!(:beer) { create(:beer) }
    let!(:container) { create(:container) }
    let(:required_unit_params) do
      {
        beer_id: beer.id,
        container_id: container.id
      }
    end
    let(:full_unit_params) do
      required_unit_params.merge(
        bottling_date: 10.days.ago,
        purchase_date: Time.now,
        best_by_date: 2.months.from_now
      )
    end

    it 'persists a new Unit record' do
      expect {
        post :create, unit: required_unit_params
      }.to change(Unit, :count).by 1
    end

    it 'returns a serialized version of the new Unit record' do
      post :create, unit: full_unit_params
      unit_hash = parse_json_response_body(response).fetch(:unit)
      expect(unit_hash[:id]).to_not be_nil
      expect(unit_hash[:beer][:id]).to eq beer.id
      expect(unit_hash[:container][:id]).to eq container.id
      expect(unit_hash[:bottling_date]).to_not be nil
      expect(unit_hash[:purchase_date]).to_not be nil
      expect(unit_hash[:best_by_date]).to_not be nil
    end
  end

  describe '#update' do
    it 'updates the unit record and returns the updated unit record' do
      unit = create(:unit)
      new_container_id = create(:container).id
      put :update, id: unit.id, unit: {container_id: new_container_id}
      unit_hash = parse_json_response_body(response).fetch(:unit)
      expect(unit_hash[:container][:id]).to eq new_container_id
    end
  end

  describe '#destroy' do
    let!(:unit) { create(:unit) }

    it 'destroys the unit record' do
      expect {
        delete :destroy, id: unit.id
      }.to change(Unit, :count).by(-1)
    end

    it 'returns the destroyed unit record' do
      delete :destroy, id: unit.id
      unit_hash = parse_json_response_body(response).fetch(:unit)
      expect(unit_hash[:id]).to eq unit.id
    end
  end
end
