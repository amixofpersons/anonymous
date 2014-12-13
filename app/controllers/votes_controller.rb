class VotesController < ApplicationController

  def create
    user = current_user
    @vote = user.votes.create
    if params[:post_id]
      post = Post.find(params[:post_id])
      post.votes << @vote
      redirect_to post_path(post)
    else
      comment = Comment.find(params[:comment_id])
      comment.votes << @vote
      redirect_to post_path(comment.post)
    end
  end
end