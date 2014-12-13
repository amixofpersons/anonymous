class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    p 'from the show method'
    p params
    @post = Post.find params[:id]
  end

  def create
    user = User.find(params[:user_id])
    p params
    @post = user.posts.new post_params
    p @post
    if @post.save
      p @post.errors.full_messages
      p @post
      redirect_to post_path id: @post.id
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

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
