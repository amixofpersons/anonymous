class CommentsController < ApplicationController

  def new

    @post = Post.find params[:post_id]
    @comment = Comment.new

  end


  def create
    post = Post.find params[:post_id]
    @comment = post.comments.build comment_params
    if @comment.save
      redirect_to post_path(post)
    else
      flash[:error] = @comment.errors.full_messages
      render :new
    end
  end

  def edit
    @comment = Comment.find params[:id]
    render :edit
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment.post)
    else
      flash[:error] = @comment.errors.full_messages
      render :new
    end
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to post_path
  end

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render :index
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
