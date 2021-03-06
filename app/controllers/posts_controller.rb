class PostsController < ApplicationController
  respond_to :html, :js

  def new
    if current_user
      respond_to do |format|
        format.html {
          @post = Post.new
        }
        format.js {
          @post = Post.new
        }
      end
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

    respond_to do |format|
      format.html {
        if @post.save
          redirect_to post_path id: @post.id
        else
          flash[:error] = @post.errors.full_messages
          render :new
        end
      }

      format.js {
        if @post.save
        else
          flash[:error] = @post.errors.full_messages
          render :new
        end
      }
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
    @posts = recent_posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
