class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)

    if @post.published
      @post.published_at = Time.now
    end

  	if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])

    if not @post.published
      authenticate_user!
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    was_published = @post.published

    if @post.update(params[:post].permit(:title, :text, :published, :thumbnail))
      if not was_published and @post.published
        @post.published_at = Time.now
        @post.save
      end

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
    page_num = params[:page]
    @posts = Post.where(published: true).order(published_at: :desc).page(page_num)

    if page_num.to_i > 1
      @older_posts = @posts
    else
      @newest_post, *@older_posts = @posts
    end

    if user_signed_in?
      @unpublished_posts = Post.where(published: false)
    end
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :text, :thumbnail, :published)
    end
end