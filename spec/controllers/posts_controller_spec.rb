# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  status     :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create :user }
  let(:posts) { create_list :post, 5, user_id: user.id  }
  let(:single_post) { create :post, user_id: user.id }
  let(:valid_params) { attributes_for :post, user_id: user.id }
  let(:invalid_params) { attributes_for :post, title: nil }
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns @posts to All Posts' do
      get :index
      expect(assigns(:posts)).to eq posts
    end
  end

  describe "GET #show" do
    before(:each) { get :show, id: single_post.id }
    it 'returns http success' do
      expect(response).to have_http_status :success
    end
    it 'assigns correct Post to @post variable' do
      expect(assigns(:post)).to eq single_post
    end
  end

  context 'authenticated user' do
    before :each do
      authenticate_user user
    end
    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
      it 'assigns a new post variable to @post' do
        get :new
        expect(assigns(:post)).to be_a_new Post
      end
    end

    describe "GET #edit" do
      before(:each) { get :edit, params: { id: single_post.id } }
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it 'assigns @post to desired Post' do
        expect(assigns(:post)).to eq single_post
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new post' do
          expect{ post :create, params: { post: valid_params } }.to change(Post, :count).by 1
        end
        it 'redirects to post path after creation' do
          post :create, params: { post: valid_params }
          expect(response).to redirect_to post_path(Post.last)
        end
      end
      context 'with invalid params' do
        it 'doesn\'t create a new Post' do
          expect{ post :create, post: invalid_params }.not_to change(Post, :count)
        end
        it 'renders edit template' do
          post :create, post: invalid_params
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the post' do
        new_post = create :post, user_id: user.id
        expect{ delete :destroy, id: new_post.id }.to change(Post, :count).by -1
      end
    end

  end
end
