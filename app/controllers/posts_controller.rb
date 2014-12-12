class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new params[:post]
    if @post.save
      redirect_to post_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to post_path
  end

  def index
    @posts = Post.order('created_at DESC')
  end
end
