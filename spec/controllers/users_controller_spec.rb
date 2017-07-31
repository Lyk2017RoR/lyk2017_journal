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
      authenticate_user user
      get :edit, id: user.id
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq user
    end
  end

  describe "GET #show" do
    it "assigns user variable to user and returns success" do
      authenticate_user user
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end

    it "equals session user_id to user.id" do
      authenticate_user user
      get :show, id: user.id
      expect(session[:user_id]).to eq user.id
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      let(:valid_params) { { email: "utkukaynar@gmail.com", password: "asdqwe12", password_confirmation: 'asdqwe12' } }
      it 'creates a new user' do
        expect{ post :create, user: valid_params }.to change(User, :count).by 1
      end
      it 'redirects to user page' do
        post :create, user: valid_params
        expect(response).to redirect_to(user_path(User.last))
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { email: "sadasdasdasd", password: "asdqwe12", password_confirmation: '12345677' } }
      it 'doesn\'t create a new user' do
        expect{ post :create, user: invalid_params }.not_to change(User, :count)
      end
      it 'redirects to new user page' do
        post :create, user: invalid_params
        expect(response).to redirect_to new_user_path
      end
    end
  end

end
