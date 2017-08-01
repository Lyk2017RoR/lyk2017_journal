require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }
  let(:new_post) { create :post, user_id: user.id }
  subject(:route_params) { { post_id: new_post.id } }
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { attributes_for :comment, user_id: user.id }
      before :each do
        authenticate_user user
      end
      it 'creates a new comment' do
        expect{ post :create, params: route_params.merge!(comment: valid_params ) }.to change(Comment, :count).by 1
      end
      it 'redirects to post page' do
        post :create, params: route_params.merge!(comment: valid_params)
        expect(response).to redirect_to post_path(new_post)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { body: nil, status: nil } }
      before :each do
        authenticate_user user
      end
      it 'doest\'t create a comment' do
        expect{ post :create, params: route_params.merge!(comment: invalid_params) }.not_to change(Comment, :count)
      end
      it 'redirects to the post page' do
        post :create, params: route_params.merge!(comment: invalid_params)
        expect(response).to redirect_to post_path(new_post)
      end
    end
  end
end
