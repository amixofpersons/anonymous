class VotesController < ApplicationController

  def create
    user = current_user
    if params[:post_id]
      post = Post.find(params[:post_id])
    else
      comment = Comment.find(params[:comment_id])
    end
    @vote = user.votes.create
    post.votes << @vote
    redirect_to post_path(post)
  end
end