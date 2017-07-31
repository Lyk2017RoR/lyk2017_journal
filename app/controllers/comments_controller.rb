class CommentsController < ApplicationController
  before_action :authorize
  before_action :find_post
  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save!
      redirect_to post_path @post
    else
      redirect_to post_path(@post), notice: 'Yorum kaydedilemedi.'
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path(@post), notice: "Yorumunuz silindi"
  end

  private
  def find_post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:body, :status).merge!(user_id: current_user.id, status: 1, post_id: @post.id)
  end
end
