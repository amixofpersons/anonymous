class PostsController < ApplicationController

  def new
    if current_user
      @post = Post.new
    else
      redirect_to login_path
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def create
    user = current_user
    @post = user.posts.new post_params
    if @post.save
      redirect_to post_path id: @post.id
    else
      flash[:error] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages
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
