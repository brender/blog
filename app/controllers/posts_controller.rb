class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :text, :thumbnail)
    end
end