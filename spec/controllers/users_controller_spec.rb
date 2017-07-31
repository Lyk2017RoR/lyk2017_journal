require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: user.id
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq user
    end
  end

  describe "GET #show" do
    it "assigns user variable to user and returns success" do
      session[:user_id] = user.id
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end

    it "equals session user_id to user.id" do
      session[:user_id] = user.id
      get :show, id: user.id
      expect(session[:user_id]).to eq user.id
    end
  end

end
