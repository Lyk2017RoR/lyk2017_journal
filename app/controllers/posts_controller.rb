class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :find_post, only: [:edit, :show, :destroy, :update]
  def index
    @posts = Post.where(status: :visible)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post Deleted"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :status)
  end

  def find_post
    @post = Post.find params[:id]
  end
end
