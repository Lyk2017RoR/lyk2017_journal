class PostsController < ApplicationController
  def index
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

  def show
    @post = Post.find params[:id]
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :status, :user_id)
  end
end
