require 'rails_helper'

describe Admin::OffersController, type: :controller do
  let(:valid_params) do
    FactoryBot.attributes_for(:offer)
  end

  describe 'GET #index' do
    subject(:index) { get :index }

    let!(:enabled_offer) { create(:offer, :enabled) }
    let!(:disabled_offer) { create(:offer) }

    it 'return all offers' do
      index
      expect(assigns(:offers)).to include(enabled_offer, disabled_offer)
    end
  end

  describe 'GET #new' do
    subject(:new_offer) { get :new }

    it 'render a successful response' do
      new_offer
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    let(:offer) { create(:offer) }
    subject(:edit_offer) { get :edit, params: {id: offer.id} }
    it 'render a successful response' do
      edit_offer
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:offer) { create(:offer) }
    let(:advertiser_name) { 'MercadoLivre' }
    let(:url) { 'http://www.mercadolivre.com.br' }
    let(:description) { 'Oferta' }
    let(:params) do
      {
        advertiser_name: advertiser_name,
        url: url,
        description: description,
        starts_at: (Time.now + 2.days).to_s,
        ends_at: (Time.now + 4.days).to_s
      }
    end

    let(:invalid_params) do
      {
        advertiser_name: advertiser_name,
        url: nil,
        description: description,
        starts_at: (Time.now + 2.days).to_s,
        ends_at: (Time.now + 4.days).to_s
      }
    end

    subject(:create_offer) { post :create, params: { offer: params } }

    it 'create a new offer with valid parameters' do
      expect { create_offer }.to change(Offer, :count).by(1)
    end

    it 'does not create a new offer' do
      expect do
        post :create, params: { offer: invalid_params }
      end.to change(Offer, :count).by(0)
    end
  end

  describe 'PATCH #update' do
    let(:offer) { create(:offer) }
    let(:advertiser_name) { 'MercadoLivre' }
    let(:url) { 'http://www.mercadolivre.com.br' }
    let(:description) { 'Oferta' }
    let(:params) do
      {
        advertiser_name: 'Idella Gutkowski',
        url: 'https://www.lemoney.com/',
        description: description,
        starts_at: (Time.now + 2.days).to_s,
        ends_at: (Time.now + 4.days).to_s
      }
    end
    subject(:update_offer) { patch :update, params: { id: offer.id, offer: params } }

    it 'return correct http response' do
      update_offer
      expect(response).to have_http_status(302)
    end
  end

  describe 'PATCH #enable' do
    let(:offer) { create(:offer) }
    subject(:enable_offer) { patch :enable, params: { id: offer.id}}

    it 'enable offer' do
      enable_offer
      expect(offer.reload.enabled?).to be_truthy
    end
  end

  describe 'PATCH #disable' do
    let(:offer) { create(:offer) }
    subject(:disable_offer) { patch :disable, params: { id: offer.id}}

    it 'disable offer' do
      disable_offer
      expect(offer.reload.disabled?).to be_truthy
    end

  end
  
  describe 'DELETE #destroy' do
    subject(:destroy_offer) { delete :destroy, params: { id: offer.id } }

    let!(:offer) { create(:offer) }
    it 'destroy a offer' do
      expect { destroy_offer }.to change(Offer, :count).from(1).to(0)
    end
  end
end
