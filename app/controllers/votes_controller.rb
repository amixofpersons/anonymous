class VotesController < ApplicationController

  def create
    user = current_user
    @vote = user.votes.new
    if params[:post_id]
      post = Post.find(params[:post_id])
    post.votes << @vote unless already_voted?(post)
      redirect_to posts_path
    else
      comment = Comment.find(params[:comment_id])
      comment.votes << @vote
      redirect_to post_path(comment.post)
    end
  end
end