require 'rails_helper'

describe Api::V1::StylesController do
  describe '#index' do

  end

  describe '#create' do
    let(:name) { 'Style' }
    let(:required_style_params) do
      {
        name: name
      }
    end

    it 'persists a new Style record' do
      expect {
        post :create, style: required_style_params
      }.to change(Style, :count).by 1
    end

    it 'returns a serialized version of the new Style record' do
      post :create, style: required_style_params
      style_hash = parse_json_response_body(response).fetch(:style)
      expect(style_hash[:id]).to_not be nil
      expect(style_hash[:name]).to eq name
    end
  end

  describe '#update' do

  end

  describe '#destroy' do

  end

end
