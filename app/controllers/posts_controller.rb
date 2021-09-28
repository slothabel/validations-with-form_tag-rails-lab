class PostsController < ApplicationController
  def show
    find_post
  end

  def edit
    find_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :category, :content)
  end
end
