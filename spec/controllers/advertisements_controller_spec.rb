require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  
  let(:my_advertisement) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_value) }


  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: { id: my_advertisement }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET create" do
      it "increases the number of Advertisement by 1" do
        expect{ post :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_value } } }.to change(Advertisement,:count).by(1)
      end
 
      it "assigns the new advertisement to @advertisement" do
        post :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_value } }
        expect(assigns(:advertisement)).to eq Advertisement.last
      end
 
      it "redirects to the new ad" do
        post :create, params: { advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_value } }
        expect(response).to redirect_to Advertisement.last
      end
  end
end
