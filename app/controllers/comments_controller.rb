class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only => :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter,:body))

    if @comment.save
      redirect_to post_path(@post)
    else
      @post.reload
      render :template => "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
