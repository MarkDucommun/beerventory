require 'rails_helper'

describe Api::V1::StylesController do
  describe '#index' do
    it 'returns all style records' do
      styles = create_list(:style, 2)
      get :index
      styles_hash = parse_json_response_body(response).fetch(:styles)
      expect(styles_hash.length).to be styles.length
    end
  end

  describe '#show' do
    it 'returns the style record' do
      style = create(:style)
      get :show, id: style.id
      style_hash = parse_json_response_body(response).fetch(:style)
      expect(style_hash[:id]).to be style.id
    end
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
    it 'updates the style record and returns the updated record' do
      style = create(:style)
      new_name = 'New Style'
      put :update, id: style.id, style: {name: new_name}
      style_hash = parse_json_response_body(response).fetch(:style)
      expect(style_hash[:name]).to eq new_name
    end
  end

  describe '#destroy' do
    let!(:style) { create(:style) }

    it 'destroys the style record' do
      expect {
        delete :destroy, id: style.id
      }.to change(Style, :count).by(-1)
    end

    it 'returns the destroyed style record' do
      delete :destroy, id: style.id
      style_hash = parse_json_response_body(response).fetch(:style)
      expect(style_hash[:id]).to eq style.id
    end
  end

end
