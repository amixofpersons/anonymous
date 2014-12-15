class VotesController < ApplicationController
  def create

    user = current_user
    @vote = user.votes.new
    respond_to do |format|
      if params[:post_id]
        format.html {
          @post = Post.find(params[:post_id])
          @post.votes << @vote unless already_voted?(@post)
          redirect_to :back
        }
        format.js {
          @post = Post.find(params[:post_id])
          @post.votes << @vote unless already_voted?(@post)
        }
      else
        format.html {
          @comment = Comment.find(params[:comment_id])
          @comment.votes << @vote
          redirect_to post_path(@comment.post)
        }
        format.js {
          @comment = Comment.find(params[:comment_id])
          @comment.votes << @vote
        }
      end
    end
  end
  private
    def vote_params
      params.require(:vote).permit(:post_id, :comment_id)
    end
end
